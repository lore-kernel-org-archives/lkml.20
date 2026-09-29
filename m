Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A921E4FD7BE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676380; cv=none; b=mBL7/HZ2imQnSMPW/ulSsqY7acE38ljmzIgTtL5/rkd90EXxRPYP3V8donoMjcRL1Yo/Una8NmdxDbC/GmDcB32kGWut1ZBucAhZa4VxSfYk6wU/VOaP6A1h1+M5HhAws6dB0MdymGzWMbi7Huu/v/seMhyvWXP13NIgQsF6NGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676380; c=relaxed/simple;
	bh=qOkoB1UvmuC4YZqe5Fz1zEEcDa7BiDDxjJDSjZCF8fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRXIdMSAJiIzYcBmYeEbsSKK+hs3xkv8bUk/3U/UsE39Fc7dtoLkVk482v91xxEHuo9HR5z3exOhmxvyN5+EjuWKgiCEiEToiqmjiwxbTB+3YO6b8JRfMoytt7M3OsJoXTuIEEcig2oWa2S+2fuLgXf+wlKmND6kAp9T5zPVq2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=B99OoG1s; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="B99OoG1s"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so2357402f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790676363; x=1791281163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPuRlti25Fuu3NRfeKW/Nl7M5gDTcAuzPve5dEthuXw=;
        b=B99OoG1sjwpsNIExhUSsPk5rt/KuSYlxeKgYVRIOTHTbcgkOpb1nWwn6wsMwH0Oz8V
         o/7lLEIqgfC0iAVSH8XgRvUTFAllJ+r+394YKMpn041IesDXWJrw6CJekFTQuY9e4wfl
         F65Zg8W1xWrdtMIrVXUVPlSXjlgnCUSAoYtze6gZFbf4tM4Ysd+21NvuC+sYJnIAaqaW
         qwdUHu1fx71eZKol6umL4LydGHyiPPNvVtw37MX5+07gZogfsrjAflmYZkQ9a1a50bq3
         Ei6JmnNBRYBXnZU/5o1zEv4QyxdS7qcKrMLOeSY58RgC4rETnJW/KghHyeJ+70MB+Jml
         ZfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676363; x=1791281163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPuRlti25Fuu3NRfeKW/Nl7M5gDTcAuzPve5dEthuXw=;
        b=Dx1TVPWiEfsNW1QRUhufNJkOQc+kpmx+RKftHh7uimpFTcbk/9AO+HUYCMlB+pzD2u
         F5ZDlFjFy77AwdoYfq2DTRp9ZCzCqBFfCCwfQSfHhmCFOH/191pZTYEDWBiVtAvOojl1
         0CgDa4URZlCBnyexa5VUW/U5G6HLia+5sq209P1HKKf5MQjbRY2ZIe1TA7FRgXOXfC1P
         LwDcCW+55C8XpHAXCoz+0KUIPv0+1aJemIUkIra8hKQQXgtSz0JrUbHxJopcX97l4py9
         /R/0rf35IHlrid1TXBQhHQiGvttAoXo0l2qQnNVlOjcLM3W5ewTRxeV5+DC9XNaOOcji
         O30A==
X-Gm-Message-State: AFq9FYK4gPAeyCJDlhvmL69qh+KTcKfoBZBJ2hRBlv3pZBrvUmlqTXXC
	dlDzQ5UePvTtSeSgwZVnnCTqHZiwwFdNA97HXqRAkzXAcyXABiPwCUM5fNMU8NlvpGM=
X-Gm-Gg: AYBFou3dM6dBtD3K32NwLLtB4OG32opxMCG6BHtvNwH5uNTWJPPynwo0hQEe3sW6bTe
	dotUjMzqg1a0bBBLZlnDIWucGIOk6i/Z6xCMRIRCTyxNFmMSWfzXo2o3fgrl3DhktSrminN169f
	zE8Wwg0F19mqlcyS31/hjTpn7nhIkb4a8GIfklt/c8CWib9W5VAwdPTWcAAq3LTQsZ774WT7YRu
	8VycejAKZ3jDmvmQ5rHhterG7F1CEfOGa75WyCc8s+clDJSoObecRCJQ0NwDEgXlYjTl9C2Y1+Y
	4ZwRumzjJ00yHs4jPuqqnetBaylyXefBfG9CwXaac6XsxkhOxKOqL0rYLansF1u+FaKdeoCeV3N
	z7+fS1eEHKoCwS9Gv5RsmRjVLRZ+tyAsY0sm1TRcul/9YJs2S2BbwzUpN5Z60BrkhDh+PfwqgBu
	nP352/nWQfbP7e6M8nBkZAaTD6yGEx1ptWPCU+l4l1WUThwzpgesvPi7gpDF5WmsrMFQRro/N8n
	1T45TAJ++sWZb7I
X-Received: by 2002:a05:6000:2504:b0:485:ac3b:4a79 with SMTP id ffacd0b85a97d-488716a1af1mr29004379f8f.43.1790676363094;
        Tue, 29 Sep 2026 03:06:03 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502f79dsm2954995f8f.6.2026.09.29.03.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:06:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:05:47 +0400
Subject: [PATCH 2/4] regulator: of: state who owns the array from
 of_regulator_bulk_get_all()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-regulator-get-all-v1-2-e887c66a47f1@flipper.net>
References: <20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net>
In-Reply-To: <20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=alchark@flipper.net;
 h=from:subject:message-id; bh=qOkoB1UvmuC4YZqe5Fz1zEEcDa7BiDDxjJDSjZCF8fI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTt7m1Z9Zv1RV2w79x3f+tfB33/dH7WkgfOOjL+v5pWb
 /dpfafr1DGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUt11i+M1W7xUyq1a993NijNvBFa4Pz3dnSzZuP/B/Xf6G7HzVgNOMDBPNz+0
 4vmpjcfa2gqLJ/yetzvwd4vzok/rE+GtPTuQGPGQFAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

of_regulator_bulk_get_all() allocates the consumer array and hands it to
the caller, but never said so. Its own error path frees the array, while
regulator_bulk_free() only puts the regulators, so both callers release
the regulators and leak the array.

Spell the contract out in the kerneldoc.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/regulator/of_regulator.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 785b7a11dfc6..09e26febfc83 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -929,6 +929,11 @@ static int is_supply_name(const char *name)
  * before returning to the caller, and @consumers will not be
  * changed.
  *
+ * On success the array is allocated here and handed to the caller, which
+ * owns it from then on: release the regulators with regulator_bulk_free()
+ * and free the array itself with kfree(). The supply names live in the
+ * same allocation, so they are gone once the array is freed.
+ *
  * Return: Number of regulators on success, or a negative error number
  *	   on failure.
  */

-- 
2.55.0

