Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8C511E81
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677924; cv=none; b=WpaNC5qJqiRoyAon3aXcI9+A+oFJ10eJRJi5rO0hPN0RB0NTx11qvOGMYaDMyt/tBhZS1tEeime5Y6+pBGr2+RW4LAU8kqlaJLg6Ohr8nphVLpLZGlq1zpJFT8k5/3oYQAnZMKNurMyl7aIWFFCD/QJM2MRQFWxPfzOv/Urhi2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677924; c=relaxed/simple;
	bh=4qopj4ITR6b3lFeSA46Ud1bcZg3mBy1B8KlT9LXGIVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8msWMf2s8mkfG4DBq1Dxu1G3NL/jqM96GmhIElrNCShayBnBLU76vWrOvmPJY923sa7vmLv5Y6/O2V4Uy/pm4Yz4BFanMnrQeOYhimtFwgAVoHNspy/Mpcn9cXAZ95px5CaDoxQYWjhdlyY9ZymlZJ5iNBAxCWN+1Uatovs5pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5EuV84Q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5EuV84Q"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso346547a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677909; x=1791282709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drVHWhle8VBZ46Gnqfrb8FAL5dCpUZourJung9rgM3E=;
        b=A5EuV84QJygCYxUJ1pXGotI44H/C2QGR7Nh6/7UipC0ufpskXDhiDw4tS8osgougy+
         N4FY5L0wYBMuWr/HBsQH+wQLQOL8Z1p09vjg+ZJMqaG09Vn+ZTwUI83x0rKPYskv9hQj
         Xz98dRZlPPn1+zBYTzEu9+hRLsykxsdKqCAyP8ap3SCfeqZmCFW4qn+iI15m3f1+20Lq
         5gRRtqbyrrfCbw5XcqiyyFhDWp/UR4+B1ey7RWHQIGXobyONMqzqZKbnh5IOJ3MxQNmS
         VtdU8my0eTxnbO5vlbbEwRboEE65xJWDovm56Gx9PyCCqjq5Ggcu3iavOLO8HfE6oPP/
         Q6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677909; x=1791282709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=drVHWhle8VBZ46Gnqfrb8FAL5dCpUZourJung9rgM3E=;
        b=jIXl+vWtVLNg11ZPfoxFMxClFsK/8hbudkysJjk7iOLnVBF1MrMf1ch1PNUJ4PpVxH
         TbEjX0bQZ3LP8gUL3tTwLLY4LwXBE6uKKYalD3pHuAMGWWdicjzZUYTRO3zjJ4k872BV
         sY/LLl9reNG6z8NZDRyhWG6cw46mp+qCWQ8COoJO1UyqWbyy5UEFl3ztG1BX5rD4Ulfb
         Mw2mNIFocyvCKTdV5vjfZW9idlNnGqf0N+dq+Tlt21DK5/kfvyEutPuEvbYI/ZsdNvaa
         HOQ6WMPUw1oXVHF0If7PfHuaw2w2zUgvpkne/UsenrB6JmcUPNNS93Z9GgmVF66D9W1M
         01JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhVcTQlXbT3x8Fq8s/N/kT6+aewi1vYcTSJAFl9U9P4neMuG9B+i2S/s/fHxBPL1PACqo/PfEjeogy9z4=@vger.kernel.org
X-Gm-Message-State: AFuF++mCM5p7ACdOYbezVNV7V96ADUsR5p6r7B32ZX+IBznbe4RbWfoU
	0GqJaT8ix9iOO+YxctPEEdVISS47s2LvsK6TzsCD6pY6Dy4n87Xrnjpm
X-Gm-Gg: AYBFou19wbZkpPB0cOh9rXMpP2X1AKalCBnX66mcxu9w2//FcKvTIT1HpSaL2am7oND
	FKpVVwLy/65ca1zItnmSIEe8geZx7qjenw3lpCt81xr+YDMBLtLEgH9anXsXQRfXCvO02nDIDTn
	Ue0zPaSuVFNtfde5xNW3DW6U+psPG5T3n9p9L3HTQdkovbOQlElAhtzo5v1MwTAsK2mUTA6Ilby
	NJp9fx+LFSZ0MkEzdYaZcx7UeyeSIuaJW/ApzZHhmId5iRKl30vh/uEzJv2A6KIcRntAmuST+Q2
	DdG/AqgnuH7dnOcqU5WjLO2dR8zJmL9ZaY58L7bD/UcU8Jw3kCzE7sq1rpXQFc2Rqq6jTATSj3V
	JfLe9VtdL6nTHx4yMGlo9TpKDpaekrXZKop5/k9Igh+8OSYAPF31L3i+quyKu6uimtw7QwIZWo3
	mze/2N+SbvoIqGymoOacxgHsGQH4iq4HoqjYuHDDt1jGCzNB+2TU5FKmfpqwUsSgyRaGwWVLpbf
	VQR7gXn2nOuTg==
X-Received: by 2002:a05:6a21:4ea9:b0:3c4:3538:d8c with SMTP id adf61e73a8af0-3de22dbee41mr17588321637.2.1790677909397;
        Tue, 29 Sep 2026 03:31:49 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5901239a12.13.2026.09.29.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:48 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 18:30:28 +0800
Message-ID: <20260929103053.10241-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929103053.10241-1-liujianfeng1994@gmail.com>
References: <20260929103053.10241-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hamoa-based Acer Swift SFA14-11 provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v4:
- Update patch mail with commit changelog

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd7541..f2d2a05c910ce 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2215,6 +2215,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "acer,swift-sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
-- 
2.47.3

