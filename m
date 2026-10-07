Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77D4B049F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380877; cv=none; b=RdS9hqsu9TgQBCzb6HD9YmMs0Ov2+GOaBlyxL6lqHcP+uHAmGepzVAS8z8Fr5b+YLkUiAaOwOuAT1BprVRl6W81hIZnHg3o8jgXgMcuGrTGht8rYaxRZUiog9K3oXO/Mba/i54RYy5icYfvG3omg9Y8uWuzQOnOJoEnFaW2Pfes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380877; c=relaxed/simple;
	bh=AD4TAXmybw5qBrGEaCQw6Z7FjcyP4LWybfXWRYdPs6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RD/hULUZczzkkCWWnPa3YnlUOI2MY+q/F7t6HRpJ8RmArvDxKrlotLRxuuShqR0NpiCWJ+iHApnaZRigR82nCcvH0zBy0Hhs9xqj3a7ojOQ7LECALOPnZ1AITnUPDHIZEXQFOsybMFxCjxTDpDeZhbElFs4PKPRZpeCjP1Dxtds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqstUFK3; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqstUFK3"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3515f9a5d25so1791894eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380868; x=1791985668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J85O2LckhxsuXE9VLugeLGefrHve4tVD/epH1sMymxU=;
        b=mqstUFK3GplB4fERevWh12mUiTSM4G/zHTddul4PKFJC3RLEc5GlP+yLuLdW92rL0b
         0Qg+ez8GRKtVC0u82V5DuIa9S8ek7h75tSXtklXkBfcxwF58aP1KI9JpuBZ4aghjKN5Y
         BB8azcyBSCd9z71t13apTfvn+LYbOiZh+Ff2uFAQ7ygFlilL7ga/IkDqLciSVvCVvWIU
         PtcY0QlAr+FrTtCkAQTFijiBn6yJndE/rxXeL8Tfa1K7FoKd7i3C0G6kb4t+yfLhcwtx
         y9Wv7YizrLMTLx4aEVxCpjNQjBYq9ou8r7ilnbMbHGgb35Dg+fZHduUG7zxfejt2dX5x
         ZKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380868; x=1791985668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J85O2LckhxsuXE9VLugeLGefrHve4tVD/epH1sMymxU=;
        b=iNlsG8FMnzvQb5T3SDmPvman5LzWUn2TzyeeIzBp+hJzpyG+KGwOyXQoD3Lfx5Ovj8
         eBa0Fe04xC56t2fMqjzzN+rcHacWQdZnA/o6nKx1+ZLtDLIH4DSNZyr/Bw/C1noxM6/H
         lm1OCTx2LK0ljZamdejqqxeTdF2IaYv/BdHS3VXEyDeeU076ty/c4x+MbH0xKwYlnnlB
         bxOOHQ7eEiPqU2v6rEqigEYaNuQ/rl1WdP4F3rLjQ1OmSdM8RYA7IXhGZdmNYY5/xukP
         ea6cr4XhRxBmeAb0Yc/2FxGSXMIVm+oVqwNc0fSR5dNYKro2W346zVhI89rGn8xeEGpB
         h9XA==
X-Forwarded-Encrypted: i=1; AKwUvBxX2kPVHZEn2OZPGv4t+U73k1Enomy1ORtVoiaEp89F1nwpyGfUfuTJoqFCMQdTd4nxwOf1QiazhtP1ETM=@vger.kernel.org
X-Gm-Message-State: AFuF++nWCEDkf4/E9ORsnSDl0MW91Pw7hRRtI9EvnsmQCGfPZVX+YZ/c
	NL1K90WfKouPE8V/gY7NhQwZDU5x84/Y6S+SyJyIpUdmo0E0ryZ5mOY6
X-Gm-Gg: AYBFou1QOSa5EMimFnj1u671/bOcXY7LgrilANgllBemzS22id+WGO5tdipZqYm+Tjw
	wOoXjgE9aVO8tYwK3Z+dcTqD6/bWyUQdgbvP2g8MtC7tfxVdpandcr0VxFEudpHyR9jXPh9Hn8Z
	j1cUNVgJWjxxk8iGy7412GM0R14BNp3al3DBhrePdzbGdsmtJPawd0D92LKownZaYVt1pZ/auwA
	IrE0Dzuu4WsCQDdLnAkfNdCL8djAcoWXZ7NMmTMyXKibe5fBqNJJ6XK3bm3lx7fSGdOOANnWrFo
	pK5u3lSvdO1LMGyEANkmUyXgYSoUq98Ug74yScDTNTNNYhe4hHzJa0ibMj9/SIhV/u0COXK/peg
	XRDDVlrwTMj+IeAmgvgZgEnhnmPcDK8KiKrErMvtul4rRnDCpJrPmnTspOUQKtkkv2uf022LTWv
	IWbhT6gxTlkYyJ8Z1h6VbjngFrAPmU4OeZVPPfhF1Ujq4NdWTGnPkJGFFZ/S2HrEKO0BmUCp5cc
	EGZkIm9ZYn9CwzaXcv3GtjLf6FgfH5O9aAR
X-Received: by 2002:a05:7300:ce02:b0:342:451b:c0cc with SMTP id 5a478bee46e88-3515dd83bcbmr2303371eec.6.1791380867624;
        Wed, 07 Oct 2026 06:47:47 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:47 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 3/9] platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
Date: Wed,  7 Oct 2026 18:47:05 +0500
Message-ID: <20261007134711.473857-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

validate_password_input() returns the positive INVALID_BIOS_AUTH on
rejection. store_password_instance() skips the store on nonzero ret,
but its final "return ret < 0 ? ret : count" treats the positive value
as success, so userspace sees count instead of an error.

Return -E2BIG for an invalid password length.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7): writing 999
bytes to current_password returned 999 before this change.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 9b989ef756ea..8018ccb2b439 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -70,12 +70,13 @@ static int validate_password_input(int instance_id, const char *buf)
 		length--;
 
 	if (length > MAX_PASSWD_SIZE)
-		return INVALID_BIOS_AUTH;
+		return -E2BIG;
 
 	if (password_data->min_password_length > length ||
 	    password_data->max_password_length < length)
-		return INVALID_BIOS_AUTH;
-	return SUCCESS;
+		return -E2BIG;
+
+	return 0;
 }
 
 ATTRIBUTE_N_PROPERTY_SHOW(is_enabled, password);
-- 
2.55.0

