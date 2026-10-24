Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839509;
	b=a4zqJqvjuU9LJKiKxEePgsGOKKMh9r5bp4GU6txyqEePIZWqk+iZOwZF6lHX2Yo8lnnz
	 IY1k/eSwlx3pUpldmdVyg0o/aeG2g/wSsE9HFtnbL//RDO07VlRIY2WWaJjT7rIEDMV/k
	 1i3ovRmT8/FU+CHLulr+bnuiPg+Ai4ADp5iP7CxnxundB2cjXz4kbk9Ek7KvbQhpUK+F9
	 QnJ3TwDiI0PVrA9a7YQjZJwlyA3rXcpga4DyMIIRmWDY2LI7Jo1h9Jh1lqR5iXAghbMqY
	 LZXlbdCiyBCM+4EuBgL1hWX0XlEnJZGqpSBKSp7LlViX7OM5gSmSRLvBbj1RDpoP41Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
	b=ItSufDOvIOd+8B6yezdOUi1pY7Hbda9DeHxycaCKeYpRK0KW6WAQNfxRKYfidnFv08rf
	 BPAmTasjpitAqiwAOAdTBcjogOwZq5Gyze68UjscfCSlEY5Kl0q1q6T+DDIQPn9ydY9po
	 DkfsmNUVE/taZI6oWZsPIDoee0NIvjDhuFkKBp3pCXgMevXFsNtcJhdhrFMgxLwc5IloB
	 LNjyPi63X3H1tLHnb469Xr95LaZwQLYy8M1evnt/hlB2bQ3hFT+OOa2/G8Kmf7qY44e/5
	 SxiCJ5euWYSq69k5Oqr3zYE5j0IrlVLOCKfLk25Nhmy/9y7ar2D9jta8WwUlfbmgU+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARIax1PH;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739C8606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739C8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARIax1PH
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1846bc43c28so1715506c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839508; x=1793444308; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
        b=ARIax1PHiwoCIAfJPY0brvUQYCM9K9tmvsOS6Lpx64OXKhsMhMEoZ2dKjKdzTqrzDQ
         ta3hp0vWxBdqRvknAidj1QtzKMOa3ujr4lyVbyXgc0+qfRFwTUo3/gYOqaiv7boqrU8b
         mdCxemuOCF/jIi8jB15H5KKMXsgMRhbomM6enOm41NmezAno+Y1l4swXjMZu4WSuj+fi
         5d/lOqnFXdjHLB6PN0mvFgrfJBxK1c7znQemDtfCGwCMW6/fmVwYyp+qyiGBD6GyAFr8
         xQgvU+6Y6Xz1tP7fG2q9iqV/PJyiUGXb5LcoxHuDDC2uo6HL863ewMkbrE5jGiMlRlgD
         erwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839508; x=1793444308;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qeLr98hwx2Npmt/8cCki7syhUFRf60PkxR+oBPVC0E4=;
        b=0s+8JX3TaEawmxspV5WZ77DQNFeNvCnDXR1no+wpALLBOcUkrE5bXTg7o2Z4TCYjhc
         XK1qI2EJ7SZE8DqK2MZH1DqjjSPK1/3pqHGIXVwQFz4UCM0n1QSYri9jl/EIpKIxXoNd
         yxTNM3I0NcbBEzDbqgRxu+YKzOHAMTnQzyqv7DC6mCqFaJoo+spOk44Mmj3fbZNtrv9k
         LMVcAFAp3YhO9JjLSg9U/4W7pN0SOYHSxO1LcZuEFE22e6Qxcbe+6mHjjUVs+LZi683U
         fb4TkTUIUw+pYpiLBNQ/0j/5oGXnxEgqUoLyGE2pjQEKpN085fY6NL9GEBP6ksgcqszj
         4+uQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+UAdmqRpNYQ8Jx7U5aRIdmO9FYkf9dHXP/Hqkr7+YGD6R5o+eemkNGQvTJBdqi0fEl+mfnasIcJvUkn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLHZuy2ZkcR8gEi2ooWb4C9Itf0Hq9HsU/c2f0Kv3aIKrz+Cbg
	z8RWZ13XGjwJ3r3RKp+QIQAy/kOGVfw7rqdy4Mv/2ympWSi2e2rSEg94
X-Gm-Gg: AYBFou1u6Tt8bOG3652NHylryEXpkstjgkkOB/EArk5P/Xl42cqhPr5AyxhlMppTpWz
	00m55PA8BUPutQ6auofE3KUdfs6vjoW4mwGxbopH48iZ1Zl/7tknJyF3aFmWBdXjHy+je1t7quZ
	8GfB5yXtj87QatvnsWStf0/a6gGUAdHc17ihKp4Wu9UGbT309irrzaXwriuAA564gwEc2dSZCd4
	im+gPtmjMXx5ZZXMDT3rx2DrkjkdpKIaDyZKcEi0DBqNHgaW7p+Y+XONMAfqT+V8jOH44pL1dYA
	pNiRPl9pTBbKnRJ90ioKC6QKj/0mkBt6Nhp7WQnBfxNerzXWrscxY2zrGpOmQYSb7LzTY0bR/pK
	3kJAkmHgOmrRsUSwTI7DUF+jL+qQMYeO54F6B6Zh9k6bOjobmRpFc+JNMM1DpkSpF77mFfLT2PF
	DkFaeL0xDXHhJOoUShbLVXWF6k0tfmojRLyH840rT7sWPRHCVTlcMSk03nQ1HpiX5AKiWN3Qx6L
	S8GYM82ExSkHSsPL7RoED5GVb5xErDpZCUL6LBGgc7UVK9h5dh8Zno+48GoZKQhqljwDjk65nvn
	N+/2GluXUxaHi4QeJz4hz0AnWGiTs1K5HSYhbLLx50Oeh8LziQoTG63otHsHSTY0dcm+hfbFc1I
	aOShODwmUlTlSqLtmqBXHr4OwAy+9
X-Received: by 2002:a05:7022:2229:b0:149:1feb:6dae with SMTP id a92af1059eb24-19937abcc34mr3812247c88.39.1792839508391;
        Sat, 24 Oct 2026 03:58:28 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm5947281c88.5.2026.10.24.03.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:58:28 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 24 Oct 2026 20:58:15 +1000
Subject: [PATCH] ASoC: tas2770: Only treat negative return codes as errors
 set_tdm_idle
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-tas2770-idle-fix-v1-1-07b02d46ec2e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ7NrAJxli/Ih6M3dYtxUpWRRD/3
 lWPMzCzg1BiEqizHRKtLPwbFWyeQT9045sMP5XBoSstusLMnbgQUPWXzIs3E9FiQf5hfahAsym
 R6mvZtDfLEj/Uz+cHjuMPgM70X3QAAAA=
X-Change-ID: 20261024-tas2770-idle-fix-b0104e591578
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=e/a/ezVcu2OnK+OjA/cnrkqCbVak9sPahUCnQku5REo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFl3+gNU41WnyMX9Wz+5bEIs08Su98KnkjcpyJj8Sb1eW
 KTm3FbTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr/nowMB/dGLKmZ6O6s//Hhfi2xCpU75Ws/sR05Fql4gv36+7N2dxj+Z6i2TBG
 Zc27Phzf7HomUPWbo5K3qmznL/WTrAb5HM8JOMAAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

snd_soc_component_update_bits returns 1 on a successful update, and
we were returning from tas2770_set_dai_tdm_idle early on any nonzero
return code. Change this so that only negative return codes are
treated as errors.

Fixes: af176d0787d2 ("ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..6b9ec8f630fe 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -513,7 +513,7 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
 						    TAS2770_DIN_PD_SDOUT,
 						    TAS2770_DIN_PD_SDOUT);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
@@ -521,12 +521,12 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
@@ -534,25 +534,25 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_FILL,
 						    TAS2770_TDM_CFG_REG4_TX_FILL);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;
 	case SND_SOC_DAI_TDM_IDLE_OFF:
 		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
 						    TAS2770_DIN_PD_SDOUT, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
 						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
-		if (ret)
+		if (ret < 0)
 			return ret;
 
 		break;

---
base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
change-id: 20261024-tas2770-idle-fix-b0104e591578

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

