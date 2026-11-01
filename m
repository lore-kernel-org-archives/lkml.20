Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571939;
	b=WfaVcJrhVuFPFoWiP4earn4MBsJjii7be2xvAkS+2Qy39xyusYt95xU96MFbYhzqdlns
	 Htlh9ZilsMpsDwEX+/rw13SMfcg+3CUSJHeXeAursMABM1HnBOz9W6UuZ/Hm+fzPqzYra
	 CYYnjqUZXCn1Gr6YwVeQmb1RRD3kpb7kS3A0p33J92sVLQadGwWxOgEtrKF/+flNbJ7fv
	 DoAXYQ8a/ndrr7VqsdGOAjZTdZocEg6IpzVvAPwCvWc7XqrqOgR3aClqcn8jj0RK+waeo
	 5GexysR0EUlQlQjQoJZqlAhuvaA8XWLtjW7A28IxqA/0JvBeIY3S60bVZdMsIgfJNDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kJOBoJUkoFAEiWtg0dNKy3UlTYdlf7GE/vw5ICcDfv0=;
	b=J64mUxirvTKM/DUdVvM9mIUXTo9hO9cXclKXAH4AsmhACKLwQtKNE/JeYW8RwXgbRql6
	 SsHnwYNYyZkU6MdRs4SD2bHQjkSdobJ8kypO6hVahP+lKwa6oNbmXSbLk4D3sahMkYz7C
	 RTcJeU3viljyLdqNSVgnuXqGmPXGXpsbELsxOzSJG8bJcthF21Ifcxk1gy27XEgjqEctE
	 /8bFDhA0ACCKLtD5sDef1kiyX9HOIpsT7f/T1Y1W4qQoR79oi9KpDRdklAG1hTD6Zboba
	 0sSnTdsKdMRxv0o3H2EJJIclXxAGhIwzpzmjU8jNslkixDjcFq7YLwFB1BfYUGJkk2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmEr+VQ1;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43C560701D3
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43C560701D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmEr+VQ1
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a17a332ecso3946358eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793571938; x=1794176738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJOBoJUkoFAEiWtg0dNKy3UlTYdlf7GE/vw5ICcDfv0=;
        b=LmEr+VQ1TBDpm8PGMdN8isqSoNjalLY06F83FXsd3LHuMPBaCR3le02S2H3oDV8bDl
         Hu+Ba/o+5nLxa51WKsanjBYw//9XaQPzbRve/L705NDW9XMvSr0uJC2SkoVPAp4GSTdu
         QUoy7fwPs2POs9RCz8bl4EMCnC6gFwvy09VY2+EunqEP57j6DGPK9TAtZwUHo+D3Qsfg
         6pLzal6tYEZaeNQFftE/FesVeLv+KT6G52Pk/CWIE1F5pT6D0tForpzNdOjWuZwMT6rd
         BGWIhNY7h+yImwTSypUSrI5L4YBdgroybfAoljcyhhmPUfhMctU/2oURCmUk1UfvGdvS
         Lfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571938; x=1794176738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJOBoJUkoFAEiWtg0dNKy3UlTYdlf7GE/vw5ICcDfv0=;
        b=AtdkvVs7fTDgu25XYDKYWt8ghPUaaWoC0i+v55im5wt39LvQqhGJy2L71QZys4VK5e
         UvF6pfWga3ZSYl9ifkbSJ4NVpvKbbzQ7u8tQWHxVEjgSJhzu087m8nXVEX8Lk7lTDYM2
         tE61rd9W2JmW3/RiykPLlVGTOEImvZDgMrXwApr3upy3Wtenaz3UP3wy1em7zxMVTwVw
         3dXvFIW82dUvwYdP+BaVx/Ga63adz97Rxobqolvsl8sr0EsUEh2GhCv+96XAitrr3Z28
         QL+s0PKt9RPzhYb5NlRMft2JJyTHn17cXpITVzS+Fczy3pZE9F4vKr53dQqvs/Hl4X1s
         hPZw==
X-Forwarded-Encrypted: i=1; AKwUvBwO4asX6/cI2be9PhwiU+hXEVMus4TgdipiPeqt0pl9t7LgNgJKKjr/qebN1PItjzIqvZOlkVDagukhltE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI0bXBNWEgxaAw51qQVDKCcrP6aSiYxWfpY8Oq2Nn1McMj2IXZ
	lMiSoU/DswFi1/EVddRJpJFdJH1D8DnAlyvLtN9FJ+Gyv8WN3uLMwUOl
X-Gm-Gg: AYBFou0nqWLCItimWLPM3UAzKx3rdYmYvVPnIEfFoNPJfU8U9Se36Ip/Fdgac9i0GSA
	nlaE2CV451BqdOfn4OUMGJdOMstHIwgLAgjdAVAMX8491E1AEXEdvcD4SePBKqeibPkbmG1Mum1
	WQZlmLByEcJsCnBbbIZpmySu3D+fJVdyIX2iA/v9hjgYYn+qwHgNnt1nimp9JTctydX9N84z2IP
	QU1wlZXBMpCMjaXCtKB0U6wXLHN7XQINHsOu/Oho7kk5bNrM/r6GOVBFIG2IWL9VFK0K2m4/ZhA
	AeEDYDLoPtie7pYKa8WmsUlvHL6i7xUK5GkDpd6C2gIrcqQl8BKFkFRPW5y7OPyl00Lv+D5GFv3
	nMWLLghY63hFHLuf0eoe9t8SABt1NkaeINZJrBbbnaFSBwS5QkRf3BGOShCLAgWJ4bSURHOjpDK
	o5rdFx7NBNrTlBPuntf/Eh0AS1ZrkUOT8Nm4Vx/aAQPL6OKisZJc308iytW/1CYOO4xwpDHNCXQ
	KWM1abkN/QMZPgx24IKkcyNpUeyA+aipuW8Xu3JZEAXD8MmA7KUaqKlUANEdlHaF392FeA8fJkL
	DN0pLeI7C39FCMYVTRVggxlZR79BWcsUG+T8KFd5HtUZiiNXisc/ZnhqM28O2lDdAvKfQygzWZk
	jvUYBgme6+UyLCFkkHmdT8Yxrhvl/0Fni1aqEitY9JT7bW44X31slw42pAnzXc9HEXJ4P/JhOA0
	oWQg==
X-Received: by 2002:a05:693c:87cd:20b0:36a:32de:a239 with SMTP id 5a478bee46e88-36a420643f1mr12848026eec.0.1793571937651;
        Sun, 01 Nov 2026 14:25:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm33089979eec.3.2026.11.01.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:25:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH rtw-next] wifi: rtw89: acpi: check for _DSM function support before evaluating it
Date: Sun,  1 Nov 2026 14:25:35 -0800
Message-ID: <20261101222535.34573-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the WiFi device has no ACPI companion, or the firmware does not
implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() calls
acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:

  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:10 (0x1001)
  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:6 (0x1001)

Here the handle is NULL, and acpi_evaluate_object() returns
AE_BAD_PARAMETER. All callers already treat failure as "no policy
provided by the platform", so this is only noise.

Use acpi_check_dsm() first. It returns false for a NULL handle and for
functions that are not advertised, so absent functions fail quietly at
debug level, as rtw89_acpi_evaluate_method() already does.

Seen on an RTL8852BE in a desktop PCIe slot.

Fixes: e897b0bef38a ("wifi: rtw89: introduce realtek ACPI DSM method")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/realtek/rtw89/acpi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/acpi.c b/drivers/net/wireless/realtek/rtw89/acpi.c
index ebb6cf555747..2968918936ac 100644
--- a/drivers/net/wireless/realtek/rtw89/acpi.c
+++ b/drivers/net/wireless/realtek/rtw89/acpi.c
@@ -372,11 +372,17 @@ int rtw89_acpi_evaluate_dsm(struct rtw89_dev *rtwdev,
 			    enum rtw89_acpi_dsm_func func,
 			    struct rtw89_acpi_dsm_result *res)
 {
+	acpi_handle handle = ACPI_HANDLE(rtwdev->dev);
 	union acpi_object *obj;
 	int ret;
 
-	obj = acpi_evaluate_dsm(ACPI_HANDLE(rtwdev->dev), &rtw89_guid,
-				0, func, NULL);
+	if (!acpi_check_dsm(handle, &rtw89_guid, 0, BIT(func))) {
+		rtw89_debug(rtwdev, RTW89_DBG_ACPI,
+			    "acpi dsm func %d not supported\n", func);
+		return -ENOENT;
+	}
+
+	obj = acpi_evaluate_dsm(handle, &rtw89_guid, 0, func, NULL);
 	if (!obj) {
 		rtw89_debug(rtwdev, RTW89_DBG_ACPI,
 			    "acpi dsm fail to evaluate func: %d\n", func);
-- 
2.56.0

