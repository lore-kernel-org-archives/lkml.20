Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137A3CDBB5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022129; cv=none; b=LkiS42H6yhP0mVM9zAPkZRkpPdssO5hfYgRwnF/2ppfe6kjU2fcW4b2ym5WSq1ux6rQQ2OHZWEI02cdANl6jFH4fWoEGBtOCQ6S5HD//9DSaTyOH7JN9PFJLnQva3gqBRbrg9Uf/NzA1EFnWG/u2/QGFYOyegsP90vW0ezmFBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022129; c=relaxed/simple;
	bh=D7eWHSQ6FGL04ZAqbgWpMwlhuvigXVm6r0XakhIFW4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT0T+cg6coOSCDN+F6lNn0gMpkZQkQtFAM1FYrh2XWtCohdn8Cs8ITC5+PWb9oTPV8L2yLWMbZjKwqtFt0/1Nxd7itfuFDW5mOyiHOpLwWuYxlWRC5gU++LKxyDf4dTVkJ62+ICKJzKsZCt4sX91Q3R2IA1nmeH8r5j0wsr2W30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V20XgBOi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V20XgBOi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cede6375caso63855ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788022127; x=1788626927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cV+7C0QRGOca2ge1k+P7X0BTEoHbXlPi6yIKDKsgu4M=;
        b=V20XgBOiuU0T2FsndiT3PGA9f9hB3JxzerJvOjv0BwkhYrfwejXBA1ueJU0kOK1Nkp
         +I0yn92GCroqLgVjUgDA3/nXp2ELxsjuK2wgUX02XpGfaRHvVmxJCYV5B/Ix6/BEfFAc
         DcWGcu0/UaBMbdIigXlz66EO9iYsBKuAeuk5pfv/EyreOwf5+tjVAvcIns6LLjKZKVmg
         wb15KlGjSMIaHp71giBU5mfXjUpdt5XAs0htvqjaMeyqsL1bNm2ypbs4NdykZoOddAwI
         r3DuI+gYxQE1hTMag28YO8znVddYyYxvjE6kfBuSOQwEA+Z41pnBk9R1Wh7RZbaxrGRV
         KPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788022127; x=1788626927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cV+7C0QRGOca2ge1k+P7X0BTEoHbXlPi6yIKDKsgu4M=;
        b=DGsrSGtAYTZZVDSPXafw1nVUA3LAisbHWy0QijQwYV/UcHzOWpxcGeDE28WRjQOg4d
         nlCb2VRfFD9tqJEsB/XrlClYnGFDuAFi5k4SMHBAGaLEsrxVZrisoZmS6tbxHRfX6tnE
         eVVlQYWvPUiCYRrGtyrAWnq9V9LrDRXVA55II2dsSR42WXU3DZ3OEl3wWEUjccag42Yl
         mpOeNSQ0sv2MA7RYxB/64pSPJk59HZfuyqTuhoYZ+DSAYmJkL3hIoCmz9MJ887WIe2uL
         dio4/zvL48LkJndsNgFmUq9tzRpGIvhUVGDwg+j89lGeLTSq5WIq+wn7cCZ62K0QLcEO
         sc6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxF3b2FbJY/+UBTp8YW3CVmtTkL5ONfVMbZvSzxVvy+dnu3D6qIg9FRm4py/du5At9ZTFisBdJj8BCuCko=@vger.kernel.org
X-Gm-Message-State: AFuF++maC5JBCPZIvh2+YP1KSIG6Jrxp/f99qy0gtKGi0w8niCAeGXpp
	HLLruoXTnokRvZOq1kJGuF9fJgjqt3YHAEpzjvta4ktOWJawKisMtyjh0fLDadj/Qg==
X-Gm-Gg: AYBFou3a6HY9kHZI+nkufWxJS38tD/NoF/6r/Pc/wadFy9I5CtyJ/arB0Kc5GWuwC19
	Ew159NvAJ5Nvl6OqxT2POJSSGVucm1BPj06I2CenCbS4JKyPJBhL0RbzGWRISYGLaKph2We1U6b
	Pw7M6Nzbyge2lyLCDDXgsoMev+5cGEZKW699BpqGdJab7hNj0uhRhDyk5d5epkmfCMa2EpY3mSI
	YMLGJ+uVy2nqm08kdBoqiya2adz8Rs269ZoebWS3ss+Xf0evX3vLhWZMxx5cLb2ap1y9Z7RAaIh
	bl3nOUb8XLg6zoYemrsbAxYFM7B4NFg6OEdPGNHRGFEwTOjeGj5S/CgnUgDeu1fWr7Eg0fYsV3D
	uZVwCBxYZqN1SyRAeuhRVEQDbitMtTifOVHC6E/+vjnfKrtB8zJa1cBHKoQb9mRyisAfTkr9GQY
	5WF9QDYxUvBQwLAgP3IvXu6fOStTNKR2jnY5+RVgo99JLRyRqwPNspaHVtZ1kkX9uwapo86YxYk
	jMDjVvt9j1q70qDVOFSiw1jtoopvl18K2PhwI5X2yeecS7WbNMJm43HElBiunBVN0GBEb2za6wU
	Sk3NkZo=
X-Received: by 2002:a17:902:d48d:b0:2d5:db3d:1a45 with SMTP id d9443c01a7336-2d8df7af3dbmr4629915ad.18.1788022126689;
        Sat, 29 Aug 2026 09:48:46 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869283sm15242575ad.43.2026.08.29.09.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:48:45 -0700 (PDT)
Date: Sat, 29 Aug 2026 16:48:43 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, kernel-team@android.com,
	Lee Jones <lee@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"open list:UHID USERSPACE HID IO DRIVER" <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6.12.y] HID: uhid: convert to hid_safe_input_report()
Message-ID: <apMNa0aiNEuS2G94@google.com>
References: <20260827220428.2988999-1-cmllamas@google.com>
 <20260828-stable-daily-0004-hid-uhid-safe-input-report@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-stable-daily-0004-hid-uhid-safe-input-report@kernel.org>

On Fri, Aug 28, 2026 at 11:34:35PM -0400, Sasha Levin wrote:
> > Convert uhid to use hid_safe_input_report() and pass UHID_DATA_MAX as
> > the buffer size. This prevents the reported regressions [1], allowing
> > hid core to zero-pad the shorter reports safely as expected.
> 
> Queued for 6.12, thanks.
> 
> Could one of you send adapted backports of the pair for 6.6, 6.1, 5.15 and
> 5.10?  I would rather have them from people who know the HID core than
> do it myself.
> 
> -- 
> Thanks,
> Sasha

Lucky for us Lee has already backported all the bufsize plumbing into
older stable branches. The only missing piece to backport the remaining
fixes would be adding the __hid_input_report() bits. We could extract
the following sections from mainline making these backports trivial.

Benjamin, Lee, wdyt?

---
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b924980b5783..154f0ff8021f 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2072,24 +2072,13 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 }
 EXPORT_SYMBOL_GPL(hid_report_raw_event);
 
-/**
- * hid_input_report - report data from lower layer (usb, bt...)
- *
- * @hid: hid device
- * @type: HID report type (HID_*_REPORT)
- * @data: report contents
- * @size: size of data parameter
- * @interrupt: distinguish between interrupt and control transfers
- *
- * This is data entry for lower layers.
- */
-int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data,
-		     u32 size, int interrupt)
+
+static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
+			      u8 *data, size_t bufsize, u32 size, int interrupt)
 {
 	struct hid_report_enum *report_enum;
 	struct hid_driver *hdrv;
 	struct hid_report *report;
-	size_t bufsize = size;
 	int ret = 0;
 
 	if (!hid)
@@ -2140,6 +2129,23 @@ int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data
 	up(&hid->driver_input_lock);
 	return ret;
 }
+
+/**
+ * hid_input_report - report data from lower layer (usb, bt...)
+ *
+ * @hid: hid device
+ * @type: HID report type (HID_*_REPORT)
+ * @data: report contents
+ * @size: size of data parameter
+ * @interrupt: distinguish between interrupt and control transfers
+ *
+ * This is data entry for lower layers.
+ */
+int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
+		     int interrupt)
+{
+	return __hid_input_report(hid, type, data, size, size, interrupt);
+}
 EXPORT_SYMBOL_GPL(hid_input_report);
 
 bool hid_match_one_id(const struct hid_device *hdev,
-- 
