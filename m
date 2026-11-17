Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897119;
	b=cTIy8g1qn7YCA6/NFUg2V28vwslZR1LGQCjJfk2eHmvQOrFEs1A2hi1qu7ngFrnH0Ck5
	 +y/TuduVmX+D+z6ergEIndlu1xNxwk0klXO2UO6K52GE1Xp06t0rE5B/hX/XeDb9Fv+7J
	 SSvIOypk9VyH3siJm4xqBNH0B+lBZPR25fWV4ZGUH1qQy01b6DjToc5fkuk3a3ibesXiI
	 NUCKdOBJS50ohe65vIvXkXwQlI1R0SEq9HG4jngEjMDsvTnOLMa9KUGhP2B3EvYOBF9VI
	 yF2aoQ+jNOSPh+Y5lD/MFB23GUQN2z/OEG7PsyvWqb0/KTJiRclzvJQnixOQ5iPusZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=2gJeu9lz3FypG3Skb0xDHUuQAQkZLfZt0HTmDptUfys=;
	b=vCAhqHllhx/VA6vqYU5R8YxBf4b9kjBCa1GjkHz+iFFWCTi/ZNOnPE3lnhUE65xzBq9f
	 yFv4AVtLAOrNZx51K78NvhsGKm9uXCgdqZzoeZ3Wu+RF0FA0HE2pxjagQivDPbLPkAc5n
	 Vtk1cUONbtn75DZ6rEvkWKTb5I0SoYkiW/FxNO3U4ntWz6rU1MOP0QrQ4qCBsFSC0UNg6
	 fGO9UxjRau5yA4hhNP1E/2gh0hbF9M/M3B9FoCW5SDrWHLwUGVe+0QWbqrdsZs8ucvhAY
	 WDlMUnT1dYH7YKRKE+by63yNN1kXK/b0sDTf2N98BUd/Sp5amGzbB9nR7hXi6m+Z0qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rflYPwwL;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5F606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE5F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rflYPwwL
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2e987949882so29849735ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897117; x=1795501917; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2gJeu9lz3FypG3Skb0xDHUuQAQkZLfZt0HTmDptUfys=;
        b=rflYPwwLg517ZWGxWOumRF3ees1MTXwr5b/HV2rmh6ebq0H4+l80WIY3gONZYdJQhp
         RGyl9gDurcGW8Oh6HFVjLvdnRfIzQ2IdFAAAR6H2/ftaNS+OTSDkP6jGDlNNXd6traH2
         7GaRDaOaDpZnAcTXhqfFeGuFuJRCRJTfORo2ny0CNZoQh1KSCAvwiDyJl7ZqNCMkPCp+
         m/4Cu+3r0Pv7yXt0DLd4owsvL2PvIySR3HS8flXNiVICYLJ0hLVE1Yt03jbNlNO8C7dG
         QvU2gey374WTI9bkp/mL9JGLLo7xj5ajwvuv8ze50Bp7ekmJW24Aht4FRWvuHZv0tvqq
         WcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897117; x=1795501917;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2gJeu9lz3FypG3Skb0xDHUuQAQkZLfZt0HTmDptUfys=;
        b=HmuSn7McZJnEzAWkxt/d264DzJnDHYmW6qJ47x1JotpN0V70n+sge4kPlUs6DjaoDv
         TUtM5dFHBM6alMdts/9LYD8p9psq2x8VRBB0LY1/S+VQxMNc2hWvhhF1uh7Fys1iNHSI
         5sN1/6J0qYVAqVZp5IWgfkZrOaAEkmCTO8NJ7LzZX8qFnxu2HxTiJjLMYOfm6eVR+OFJ
         QATQu53k04wFJIjkNVmKzDbnaxWKQGhZYGkRumMDoQMbakhIsHWMm6LtgEmI9/yRBii5
         84rKVMKhEgGy6mr8rUKX9fe0fs6gAwPW9etIFXh/oM/NcrgpH+iC6i2W8TjG0/T9zwma
         IOIA==
X-Forwarded-Encrypted: i=1; AL+hErFo/wMMiL8reruCbHGtahtQNCJHCmSOEjhBE+BTQtvkeCjjY6lMovONg1GKgQ4R705XLZf5Vdi4PnrfS+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ghHKBqXuZfvie6j1C0YMQY0vIKdUypftIrOIbgV4ryovCoyIv
	WbilJRnNRWP0B/IzgOoHDGr6PngMyPK/M2RIzo4lBA9pAxoIRMGdiSO/
X-Gm-Gg: AYBFou2BzzDTg00Kez9bty3RP69H8hf9uRGI3kKpiFiIA/VyPBdzx5l2AnBcU7YOYpE
	HLqvRnChdyB5h5m+pyFnqthx61Cu59VPe/CnvP4OXRHOu1dOJd/bArz9X/8DY9Tfb3ztCsPpwjc
	9Kj32fepY89b+U78O+AJIJgNktONLtxgMrp0j+EaJglJWpqYJek8FsU0QrOo+E4dlcRMu3M57NY
	+6lN9HQC96/ydX98z534RJ0lSqdZn2HXaGXzNz9p0KhxSfev2yYqi3iM9sdaSP9ujw6IodQ/OBd
	Yu5LBBkyYIjZAru192A8GoiaTv4XM3zonNORTKmo65vSKrIDFt4QXP3fn9AyuF58sDo2fLAE2uH
	7PORfN+YcxhEjpAYnSLWQyJEcmlVGjFnJMaB9bmv8wY/bVPERh+BPk6VZNKBSU8zOYvWdodK8Z4
	DNTCZQDZDW8ql3LRM2HNeS8pRMtKd7HHOJJnm2xFbCBaEN7jAx2vp6vACJs5BpKIA3qUU0DFkwh
	PWRFpD2EBnRj7eLaYOhWM0J0e6GRI32kZgBDmLzytOQTI8RAYm8WglEd3ZI2P6/boLpfxja4xwF
	46sJAPOMXxXtyIq0Uwf5BBPXf8diMIVb3xsochzcJswGodSC2PlC1H/CzE05qvOAcsp80Bob5Yu
	TjKTk62IzgZ3ZUY8G4EGzf2kqUBpTFOk44MDoh//woyvGgUQCgjWJJoxxVhBONZE=
X-Received: by 2002:a17:903:988:b0:2ed:3e3d:f0ea with SMTP id d9443c01a7336-2ee0dd2bb4emr122131505ad.20.1794897117285;
        Mon, 16 Nov 2026 22:31:57 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a364f6sm8477105ad.27.2026.11.16.22.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:31:56 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 17 Nov 2026 17:25:36 +1100
Subject: [PATCH] selftests/damon/damos_quota: skip the last sample when
 counting exceeds
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
Message-Id: <20261117-fix-damon-quota-selftest-20261117-v1-1-c65d687d3def@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NwQ7CIBBEf6XZsxsLMSX6K8YD0MViLChLrUnTf
 xds0uObzLxZgCl5Yrg0CyT6ePYxFBCHBuygw53Q94VBtrITQih0/ou9HmPA9xSzRqany8QZ94a
 ynVCmPTl7llA8r0Rl9P+43jbmyTzI5iquDaOZ0CQd7FCjTZ/nuDuP44iBZljXH36dM/OxAAAA
X-Change-ID: 20261117-fix-damon-quota-selftest-20261117-7c617b04fc92
To: SJ Park <sj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 damon@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

damos_quota.py expects qt_exceeds to be increased for every sample whose
tried_bytes equals the quota.  The kernel increases it only when the next
quota window starts, so the last full window may still be pending when
the workload exits.  The test then fails with an expected count one
higher than the actual one, e.g., 15 < 16.

Do not count the last sample.  Also drop the sorting of the samples, so
that the last one is the latest.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
Tested in x86-64 KVM guests.  damos_quota.py failed in every run before
this patch and passed in every run after it.
---
 tools/testing/selftests/damon/damos_quota.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/damon/damos_quota.py b/tools/testing/selftests/damon/damos_quota.py
index 879115a499bf..bdfd22f00079 100755
--- a/tools/testing/selftests/damon/damos_quota.py
+++ b/tools/testing/selftests/damon/damos_quota.py
@@ -53,15 +53,16 @@ def main():
         wss_collected.append(scheme.tried_bytes)
         nr_quota_exceeds = scheme.stats.qt_exceeds
 
-    wss_collected.sort()
     nr_expected_quota_exceeds = 0
-    for wss in wss_collected:
+    for idx, wss in enumerate(wss_collected):
         if wss > sz_quota:
             print('quota is not kept: %s > %s' % (wss, sz_quota))
             print('collected samples are as below')
             print('\n'.join(['%d' % wss for wss in wss_collected]))
             exit(1)
-        if wss == sz_quota:
+        # qt_exceeds is updated when the next quota window starts, so skip
+        # the last sample, whose window may still be pending.
+        if wss == sz_quota and idx < len(wss_collected) - 1:
             nr_expected_quota_exceeds += 1
 
     if nr_quota_exceeds < nr_expected_quota_exceeds:

---
base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
change-id: 20261117-fix-damon-quota-selftest-20261117-7c617b04fc92

Best regards,
--  
Aveline Noir <jm5905938@gmail.com>

