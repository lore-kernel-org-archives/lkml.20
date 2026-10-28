Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160574;
	b=EgTx5DagdfJvBHOIu1pj75L2XGpWuOmH47a35gTozOG9fbUBoBdL21vCDAw7JN3eu9CV
	 Z6HHNtkPT9GSdlWJTD4IU+wSx2l0gZFcbPMNvjQAWJQRnlUKYOOsJnk43kJcxjvZNa1al
	 mj9QUvF5vxA0QyTC7gIJVzAiu2eStB+MYX/3XEHVip52T3pfa/vqwbZkkFW2poziQSQtA
	 MWy6WHuvHbdtgmW9J3yJMVGb9KkJb6kvuzYN90WNU1yOY2Z7yadm9TMNmIslKvT7SYvH2
	 asgEQ6xJq90URbOSffa5SEk7T2aUm6+93kX4jD+7f/eOsL9Dujol3UolpFwqdYEVWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Content-Language:To:
	 Subject:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6c7sQ8Bp7pAJXmrZdb6hgNZF2I6R2ywB1j0/kYQTtR8=;
	b=39kDHDaW2XKEQSZwFksgPYJ+DfmTXMq3OL4GSP7RXwtxJDDVDg8ShsQ5Kbhl4wUgbA7e
	 etoJ7L9W6nOmLC0TUDXPjEDlQdRRDUEbU5U+tZvg7ooFMJAdndNpRs4yu7jAfDFexFPwo
	 nlV/RyUyG+3Fs5M09Y3zEmfKIZUF30Dfe2Zz1xA7K5f6YLEv9qEWbKqpzLWSUjSuWQdFg
	 K8yfOm2lmDS05UY0afYqVyArv1TbqgZER52aeJ9fBEDjQxUYwjQa5Vzks95TpZt5iMM/5
	 0CX2p0t0+vsJcPbH+cRxrFq2x3E+lHEUpZuQ3BpWsE6VEvxUj5bNnyhxGsNvm88PZNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOamFJBK;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8CA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8CA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOamFJBK
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so287512a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793160572; x=1793765372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:to
         :content-language:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6c7sQ8Bp7pAJXmrZdb6hgNZF2I6R2ywB1j0/kYQTtR8=;
        b=yOamFJBKSnrmmc5Ksya+JqLwYTfhQ5Ca66ctpEUoMEX9msqInjwmX2J5ES7E2MFFvI
         mRq13/TuSeO/A92oPN55K4AwCaRBRHRn333GdDaUJqKDjJ+HAAWkh/AHUG9+Hicfiuq8
         9tB9YUnuZsNjTDF3HPHKIQBEth4JkJjvLDIsJSMVGdmVXaybFM12I+BTNEV6NgTKQqrY
         u4DlkZNjy/tr8dTD0CR5E3Ti4vS+XUPDvA2RNxgxrweBEWWhta0i77Jm3aKtxKSLeIJ/
         FXk+tWNiJ07kz6QcsbBu3nPd1Gv904uZuBPOeZCW235Dk2ZdaKGiEywY7vSR6G57VO6Y
         7s0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160572; x=1793765372;
        h=content-transfer-encoding:content-type:cc:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6c7sQ8Bp7pAJXmrZdb6hgNZF2I6R2ywB1j0/kYQTtR8=;
        b=FRHo/tlwoxndBbUNbJFipre+ukPZ1cAd8RctXUHRD7/QuW9QTulEonSK9xsHyANWvw
         VcAOACfr+zuGKfS7xDybOC6KNhVN8ivqoX9d670nSjglEvU/TgByPEv21A8KEdYmT2Fp
         73G7rhgTP52rHkXXfhBKvTy6IBatn+ZMyjCwV9Bvpn/tHdB+hxd/0hEzT+AVG+iYhlSU
         qU/+8Yj+uNtgDWPeYPz0T1xaYYz1zOwSl0z8G02hQ2R2gur1EqmmlTBumZTTjF1RCf4r
         Rkng/uUmYcMhFK3ObVQUpWu7wcPmbMnxTGDvL3Y218x69sEV3C8pVyvluo6yfd0v+1zQ
         12wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmLU0HvGS6CPapqmynAnn9Kt5ia1X7fVHapJWQmx/A6B+qQulsT+C/qUcVFEDuto/xFl5yQAiE022rv+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/e7kiJ16gyABj0JM5Tcw+s+Fcswvr7M/RmHGNq0aXkoC+1QJ+
	poCy5BiTiAoPn+YiUnJ8rbadtWCYcfJ6OtsOJeHebwQ3azqXUf14QheFP4pm/rKw
X-Gm-Gg: AYBFou1WUX3he4k+nZ1UprkJelOuKRjW//VldazsvAHcrepvbw3DtJHbcfY4J011ZMu
	T4FNzwhqn/XAjNhY1m0kfj6WM2qgiGTWn1ovpovby18ZwLDLaoglu+cofe7v7+22BvqCIxe/Dg8
	5KT0CFi24rToyGn29+S1KDL+X1hlrTzY56oisX04yS2DFwWWAGJ5OMAVB67/29YPO+zI2NtEP4h
	S/yo1Z2Bq6j8jUgsWxP/cRXCxxsWOKIz9JHTwaV+3+ZJCO6b9omW1AzSHIqGS+lF7rB3J1UUrpP
	NCFRNuddrUFapcZUMHxWcgcRlBvZDqVt8CdDIUww/U/rdLskLv2Bez2PVHmpQrbYAJMG2OuOqoG
	f4ujKmpRmrUqz/kSVuUY/6viAF46zxi+L6Ah+aZREX6nGjGqwkvOLODs74NzQWTdvgA3itwB8S4
	UGgUORhMkz1FOSwoewf8GOjcwVHg7mBqY3GITQFm9PvxzOCMDUOWdj/8JAKicrr8iRzeH81vyoy
	i7IXiBqm4EtjUdxECrIxaO8SSTpHIWmo2H/vF+F/MtY54+LEj/ZCDZgc/FwvvrQ1QmMwI994rHy
	rzX0kNd5Wsjao42EyPz3JuX85cAMsRhOVyU=
X-Received: by 2002:a17:90b:224d:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3ae581b4cfemr777255a91.47.1793160572495;
        Tue, 27 Oct 2026 21:09:32 -0700 (PDT)
Received: from ?IPV6:2601:204:cd80:e00::18c? ([2601:204:cd80:e00::18c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdacd6aeb55sm2086834a12.7.2026.10.27.21.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 21:09:31 -0700 (PDT)
Message-ID: <34898827-b6b7-4d19-ab0c-55d55a0659ab@gmail.com>
Date: Tue, 27 Oct 2026 21:09:29 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cymirk <cymirk874@gmail.com>
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: asus-nb-wmi: Ignore GX651AR event 0x5e
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 linux-kernel@vger.kernel.org, ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The ASUS ROG Zephyrus Duo GX651AR reports WMI event 0x5e when
the detachable keyboard is attached or detached. The ASUS WMI
driver handles this event alongside wireless-console events,
where it can be interpreted as a wireless key event.

Add a model-specific quirk to ignore event 0x5e on the GX651AR.
Keep handling of events 0x5d and 0x5f unchanged and leave other
ASUS models unaffected.

Tested on ASUS ROG Zephyrus Duo GX651AR, Fedora 44, kernel
7.2.11-200.fc44.x86_64, using a temporary module built from the
v7.2.11 driver source with the KEYBOARD_KEY_5e hwdb override
disabled. Keyboard detach/reattach and typing continued to work;
Wi-Fi remained enabled, and evtest no longer reported scan code
0x5e.
Assisted-by: AI LLM
Signed-off-by: Cymirk <Cymirk874@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 18 +++++++++++++++++-
 drivers/platform/x86/asus-wmi.h    |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b16..c2e7328b9 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
 	.key_wlan_event = ASUS_WMI_KEY_IGNORE,
 };
 
+static struct quirk_entry quirk_asus_gx651ar = {
+	.ignore_wlan_enable_event = true,
+};
+
 static struct quirk_entry quirk_asus_z13 = {
 	.key_wlan_event = ASUS_WMI_KEY_ARMOURY,
 	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
@@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_z13,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS ROG Zephyrus Duo GX651AR",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Zephyrus Duo GX651AR"),
+		},
+		.driver_data = &quirk_asus_gx651ar,
+	},
 	{},
 };
 
@@ -687,7 +700,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
 	case 0x5D: /* Wireless console Toggle */
 	case 0x5E: /* Wireless console Enable / Keyboard Attach, Detach */
 	case 0x5F: /* Wireless console Disable / Special Key */
-		if (quirks->key_wlan_event)
+		/* The GX651AR reports event 0x5e on keyboard attach/detach. */
+		if (*code == 0x5E && quirks->ignore_wlan_enable_event)
+			*code = ASUS_WMI_KEY_IGNORE;
+		else if (quirks->key_wlan_event)
 			*code = quirks->key_wlan_event;
 		break;
 	}
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b9..b2d91e373 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -52,6 +52,9 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+
+	/* Ignore event 0x5e when it represents keyboard attach/detach. */
+	bool ignore_wlan_enable_event;
 };
 
 struct asus_wmi_driver {
-- 
2.56.0
