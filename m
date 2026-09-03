Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5580338DC68
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412770; cv=none; b=oaa1hFPOr/7W/rvvI+WbeIBCijB5rWkCKzBJWb/pOwcxCPJl+KJuMsRr5OeFeOFhcYxem3kQbqMgGhwQ4yLpTr9LDvjCHTCW+we2RJI3tqAkoY8j7+5WkcQDTJHpC4cn0/WKMz7/E9Q7nUdq9/8neOHCsAxQeD5QHYF2tWN1OG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412770; c=relaxed/simple;
	bh=4fnFeD02M5HfgMYn//yImWUpNyf2Ei+TU+3WniEA/Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqFbbm3Ek8Vty3cDYSeUuzm9N2WYmqVglXUUzXns8qdiXktFqlrsRaS76EgROO94HoZhh7eoC0RW2mUYLw4I1zTycr+8OXaiZeVbr8YmONEQackfKB92qEbhf2DwgosHa6+IZ5P1zmTicg0riupPpklfqFg1W0xOOfv6+r93a9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9WH2oas; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9WH2oas"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c7c57e637eso1156701e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412768; x=1789017568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0A05RaYRO4PF8ANfwcARnh+mky0gIQFxc21ypB2pb0=;
        b=S9WH2oasscNS03XKAZAV4Wd8/eaZ/afpaXIvhAQ/42g5z8hzHksQTNiLLGNWjqXmwy
         Y7GnMXytsjvZaGqgBEAYH39AXRJ22q+Qu4YcOXlFWc/8zEB/+AOozDEs4O3oYamWInVS
         VC/io9k0L91ysbtS5pAej+Wh/d/ZrMsthUqKPgvP69vaz7GNAwTVMagnwz9gOkVqNWPz
         AFbYo+483LnaP6tyWZQNJwjC06wtwXWsRZNiS8pnLwmjDPQxIlWae870aeHuLKF0J02x
         ZoxdeNS/ZFmTYE6JlRz5Qh8cWbyPOTkliQwl0H5c02mXGmX8Hr2hNZjd9yzyGpaxKm2j
         GV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412768; x=1789017568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0A05RaYRO4PF8ANfwcARnh+mky0gIQFxc21ypB2pb0=;
        b=st2AiANp9bkeXAD7+ilYB3R9Wy5ryLdWDu2n7uda8TOq1QxNDpAUdFL0g5tEIOEjAY
         JdmawZjKoXaa9xbWcfAPLNWxyLmCEE5840RoWyDVuPNmQXc4BH/kHMoEFNhod82A0WfN
         w+cyWtOoZgmiZLhuEYXrZAwAXAiIdIy1kljMith1Mkk0BZWOCd4uenAYhZEiclV418NX
         30CgpzkNTi9xG8MAhFPqHiTr5oqJ/D08u7SDTiQS+5C0MsyjCmI34K7MpDd3rZqFkLTr
         Eb+KVs1/2Ru/8IX6yRwH2kxh98nAcB3UXJlSXwHXDsV3ysa8MSCn3+58066eiLe49YcZ
         VaEw==
X-Forwarded-Encrypted: i=1; AKwUvBxDJfJlHEahyrx01rDCe6A7UtLiFgELjA+3WMifYYoiuFQcz2Fu2bgrgBB5I3vQUYnW37WBHCmxYn4WaPM=@vger.kernel.org
X-Gm-Message-State: AFuF++kq8meDKgqZTFTHpef/9XV+nVD1VMyrcFMPnqEbXd33HodPn5fF
	xOuE8bqAuX5q38NDuKcNoQ0CXrgiD0JkunHXmohneT3cs5VyoJ4q6OpqzmvtXg==
X-Gm-Gg: AYBFou23PdNFqQBiU+3djt0uq156XG2WTtMGZlW+BZ7YBGGjEAy+bFu8PqltQGZGT8j
	szn3rHbIdmdx6R5J5TPhdXfMrJXixX4LDGs4VlpTuHzsHeCVDzDk6rSy4nTI5n3JMnSLtFCkEhY
	kcPIlaeSx/FxcNWKVOMrssk3lv2spJ+RqtYNnqNz+PzpAYIk8/FW/lrVoIKL7T7W5KAiTfvXI0S
	u+n9/xBi6iRL/WBDNNPVXXKX9PQZ/Aq7POxXnrfvmqe5P5zm8H0pI029JYZshrgcDf9ANy+SfGi
	EQF5IUFz8zCiiW0amTlFS8v7jPpA1HGzfgIPXmIKkeOwgeZm5egqKME0ixJkeLiea7MoOqStdGy
	JF/YgtYQSwRn4mTaT5BRYRmrFK6KS1jUwzUrU6q9JwRdt6iaBYy9V51ZHMr4iHfCol3hKzHPag/
	ZmZbWxzuXYqZu0ubvnVmgR0uR1yfYM/PWTeMMK4l5/wAFkvQ5+O7Af5cNleZlWyn9B
X-Received: by 2002:a05:6122:2203:b0:5bf:8955:a8ce with SMTP id 71dfb90a1353d-5c7d27126a5mr3731041e0c.1.1788412768165;
        Wed, 02 Sep 2026 22:19:28 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:27 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 03 Sep 2026 02:18:10 -0300
Subject: [PATCH 4/4] staging: rtl8723bs: coalesce issue_probereq functions
 into a single one
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-issue_probereq-v1-4-82f153d157a1@gmail.com>
References: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
In-Reply-To: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=5798;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=4fnFeD02M5HfgMYn//yImWUpNyf2Ei+TU+3WniEA/Y4=;
 b=dFA0+EK1K+k2B8Rzv+AeX7/gx8ybHAIJcTji8yNN0g6jIj9xkUfvyCRp4vpCW7s9ZCg8msWhR
 em/bEqwMcNFDu5cKu/voAVbAM1Bm1PyPIzmXRNcNFHuJOyemFq2Go1/
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The function _issue_probereq() and its wrappers issue_probereq() and
issue_probereq_ex() have a difference of a single parameter in how
they're called, which is the value of append_wps - 0 for
issue_probereq_ex() and 1 for issue_probereq() -  meaning that these
wrappers don't bring much value, remove both of them, rename
_issue_probereq() to issue_probereq(), and replace the usages of the
wrappers with the unified function (with the value of append_wps added,
with true and false instead of 1 and 0 since it's a bool).

issue_probereq() and issue_probereq_ex() are not used in any other file
so the unified function was not added to the header file and kept the
static type.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 54 +++++++++++-------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 -
 2 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b3642c5021a230bd70e5d8fd8d5bf77ad1d8946a..c39fb142302edf267edca31babce40120c74451e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2401,8 +2401,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static void _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da,
-			    bool append_wps)
+static void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da,
+			   bool append_wps)
 {
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
@@ -2481,16 +2481,6 @@ static void _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *p
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
-{
-	_issue_probereq(padapter, pssid, da, 1);
-}
-
-void issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
-{
-	_issue_probereq(padapter, pssid, da, 0);
-}
-
 /*  if psta == NULL, indicate we are station(client) now... */
 void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status)
 {
@@ -3727,22 +3717,25 @@ void site_survey(struct adapter *padapter)
 
 					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
 					if (padapter->registrypriv.wifi_spec)
-						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
+						issue_probereq(padapter,
+							       &pmlmeext->sitesurvey_res.ssid[i],
+							       NULL, true);
 					else
-						issue_probereq_ex(padapter,
-								  &pmlmeext->sitesurvey_res.ssid[i],
-								  NULL);
+						issue_probereq(padapter,
+							       &pmlmeext->sitesurvey_res.ssid[i],
+							       NULL, false);
 
-					issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
+					issue_probereq(padapter, &pmlmeext->sitesurvey_res.ssid[i],
+						       NULL, true);
 				}
 
 				if (pmlmeext->sitesurvey_res.scan_mode == SCAN_ACTIVE) {
 					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
 					if (padapter->registrypriv.wifi_spec)
-						issue_probereq(padapter, NULL, NULL);
+						issue_probereq(padapter, NULL, NULL, true);
 					else
-						issue_probereq_ex(padapter, NULL, NULL);
-					issue_probereq(padapter, NULL, NULL);
+						issue_probereq(padapter, NULL, NULL, false);
+					issue_probereq(padapter, NULL, NULL, true);
 				}
 			}
 		}
@@ -4860,15 +4853,18 @@ void linked_status_chk(struct adapter *padapter)
 			{
 				if (rx_chk != _SUCCESS) {
 					if (pmlmeext->retry == 0) {
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address);
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address);
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address);
+						issue_probereq(padapter,
+							       &pmlmeinfo->network.ssid,
+							       pmlmeinfo->network.mac_address,
+							       false);
+						issue_probereq(padapter,
+							       &pmlmeinfo->network.ssid,
+							       pmlmeinfo->network.mac_address,
+							       false);
+						issue_probereq(padapter,
+							       &pmlmeinfo->network.ssid,
+							       pmlmeinfo->network.mac_address,
+							       false);
 					}
 				}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 8e35aabb0ccf96a2bb0c1208db8ad74598a687e0..d486cd462509e9d43d43a7d6718a3bb3935df52d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -541,8 +541,6 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 void issue_assocreq(struct adapter *padapter);
 void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type);
 void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status);
-void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
-void issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
 int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms);
 s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da);
 int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms);

-- 
2.47.3

