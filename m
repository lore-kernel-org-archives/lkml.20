Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06701A5BAE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791850967; cv=none; b=ulLDNSf+LXufVRSgeLHQJ2xzBQqdc2rvI5QQB9jVLwpImOkOvd8PCdk5r3vaPVoSzLVZbs4DDQHL0ic2CazEneK2jxOtX9+F58FQMdPSz06mDhjcBkRi2kiBPgLeLrvAQLqpYcwvDEkKzq3NuYAaQIGka/pK/p+xw0s3cbSVu+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791850967; c=relaxed/simple;
	bh=K7UaePRq9BaSpkAEaPCymyNIpn/Ox/pXqLeTP/6uCDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARZmweAJ5K2QvjZzMqqFOLTWuZ2q1J46xxOZq1VHLX1mpyC0GGMWbCbIQZ2wG0YHaMEn/watT6PUV7kavAPyRTUEBA/JELPFoNB/SXD2MFg3a6/dy9m91C1Iisf0JdOpfsqcI+UVekpIr616Hox89DmlqrfouNApUR/KpdxdMuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF/VTuRW; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF/VTuRW"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1419d3416ceso3421447c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791850966; x=1792455766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9Ot3u6KmR57ETTt+6GZrmtSr17nrcJz4mYhNrXKLiE=;
        b=QF/VTuRWk822s+cVN+KuEO9Olxd0TSG1NeJRPTuHGYh8lVeJXto37d7RutUWJ1YcVY
         jdGv6bPcEiVSLWPNrSCDSY8RvlTiHBs5hiVsSF3RnBr1N3STIKA6tWPC+nburKFtLtWG
         sSbJ8D6a42hi8qxeOeyMtlgZcPhXjTQNIrRzV4uLNqq0jhYpMTjWktJBnvGlp37xgkez
         mZafK/GN0vapAWuLoFV/xvMyR6viT3gnxRL+wg4nRwD5QxUM0fQcV2WWTbdMN6uG/nGc
         yA5tM7X0MnpkYvyv2322g97dua1Pyh67w4YWSQ/HR0CNwts1bN0AlD9euQi+OA08p2Gc
         CJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791850966; x=1792455766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9Ot3u6KmR57ETTt+6GZrmtSr17nrcJz4mYhNrXKLiE=;
        b=E4yTWm2QqH2wMWkT9n4w6J40faoaHQtyUlHcNjB+FvnO79EQnK+cNAo418WHDxxIxl
         mSF1+V8kpmt2QIfPhab+HiaxhfTRK7Gcw3pIoJI06NCvkxZq+26r2lGyRkIaOchK2pL2
         R9+Jzg71AQ/odYoe8a2fM8TxSlx9CGwJLvXMEuIhqQa8mxju7Ql2z71IFobKsAtakFXb
         g1ZD8gQ5K0zQUQdjqYaXnrlbIRtJgW/QHptrrpJecd8FOLYvfi8KjJ1wU6U4AVA7w8ta
         8afQT5Z2A5ReKhMCGpKoOhePX8GcMTmMq2q8V7dwOVnfgRF1Ty5Jtk0Edqq6QXnC2ppB
         zAfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwPSKn5hLfbAbcXhTPkLbYIKHRUbhnVyyzNdBpap+FdEQAYfa1cdC2RYTxVtm6qw2KW6pP2Nj5lg45WhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXPfVPUO5fGdhncc9w9+8HJAB3H5+jcZ8oJQgAcjOpFLgkWcgW
	xBwBwW5VYpvBxmlaxw85UBIKmZ1Zpi//mZG8VNAd8EtJrLgymHQhlCqu
X-Gm-Gg: AYBFou35iB2MiGj4Nbghip6jc5JjIip6WsBBb0XNNN99fkMG9Zrb8n8yG3ktTMO4Dca
	lAtGt8fX5IfVa71f6XEqvAc0jk5l3clwfj+OY9LrcvC+9AgIqjWRsvK8EwrfLQPxZ8vbXA4x4Nv
	62gCDc7IxSHKS4yPTgrD9e/EESa9e9lPLWktYGcc5b+igG8HTCO76EXDmylYPk2O3x31lRD1olh
	ryS2g8C1r+6nBPuuerJtofkG4sqLCyKOTbjQ1Fu5o0aPyZOgefejgaV9duwp6LxV7JYGqLeUdwK
	WFV0hHVPN19rFcCTInw5OdguiLH017y+z6kwaxEMtHZPX/AqQVGMFX8EvxhkykjmTTK1usUP+cV
	FSoRNisclJsoGKgKSw4CamF4/f3TMvylz2Vh/YZLH8RHvtZ1TPd8fCWdtV5E2Hc2n2LX5iyQWBr
	Y8mKRtGD/DDSwDButUspid5b0d9XFy2CTJG74PuU7dKOBqohQVgomofshMrVDptJLB+NhDnZleL
	9jfJ+jCiBCwhze3onrtsi9O3QiCDF3TuZPbCrSu
X-Received: by 2002:a05:7022:1582:b0:143:298e:913d with SMTP id a92af1059eb24-16a63b2edc7mr21744351c88.47.1791850965414;
        Mon, 12 Oct 2026 17:22:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:679a:f35b:7c29:e0f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm31217695c88.4.2026.10.12.17.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:22:44 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:22:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shashikirana H K <shashikiranah@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Stephen Boyd <swboyd@chromium.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>, 
	Sean O'Brien <seobrien@chromium.org>
Subject: Re: [PATCH] HID: vivaldi: Validate Report ID and length in feature
 mapping
Message-ID: <as1sq5X8rpdKLfHO@google.com>
References: <20261006-upstream-vivaldi-fix-v1-1-bbc9a7f14ea6@chromium.org>
 <asfk_jRVjY8pXzjt@google.com>
 <CAH=natbNnhVMO0vXmhTi5wipEsfMr9wy7u_PRCXDYFaWJXqoCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH=natbNnhVMO0vXmhTi5wipEsfMr9wy7u_PRCXDYFaWJXqoCA@mail.gmail.com>

Hi Shashikirana,

On Sun, Oct 11, 2026 at 05:29:22PM +0000, Shashikirana H K wrote:
> > I do not think checking whether report is numbered is needed. While
> > transports handle numbered and non-numbered reports differently here I
> > believe we always have report number (0 for unnumbered) in first byte.
> > Also, shouldn't this check be in hid core if it is needed?
>
> Agreed on both points:
> 1. Dropping `report->id &&` and simply checking `report_data[0] != report->id`
>    (like mt_get_feature() in hid-multitouch.c) works for both numbered and
>    unnumbered reports since transports place 0 in byte 0 for unnumbered
>    reports.
> 2. Checking `buf[0] != reportnum` on HID_REQ_GET_REPORT directly in hid-core
>    (e.g. in __hid_hw_raw_request()) would protect all HID drivers at once.
>
> Jiri, Benjamin, Dmitry -- would you prefer a v2 that checks
> `ret != report_len` and `report_data[0] != report->id` in
> vivaldi_feature_mapping(), or moving the `buf[0] != reportnum` check for
> HID_REQ_GET_REPORT into hid-core?

Yes, let's harden hid-core directly by rejecting descriptors that mix
numbered and unnumbered reports in hid_register_report() and validating
buf[0] against reportnum on HID_REQ_GET_REPORT transfers in
__hid_hw_raw_request(). I'll prepare a patch series addressing this and
a few other issues.

In vivaldi_feature_mapping() itself, though, there is no reason to go
through hid_report_raw_event() at all: we already have field, report,
and usage in hand, and nothing else consumes field->value[] for this
report. If we verify ret != report_len and extract the value directly
via hid_field_extract(), similarly to hammer_get_folded_state(), we
avoid re-looking up the report by ID altogether and do not even need a
separate report ID check there:

	u8 *buf __free(kfree) = hid_alloc_report_buf(report, GFP_KERNEL);
	if (!buf)
		return;

	report_len = hid_report_len(report) + !report->id;
	ret = hid_hw_raw_request(hdev, report->id, buf, report_len,
				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
	if (ret != report_len) {
		dev_warn(&hdev->dev, "failed to fetch feature %d: %d\n",
			 report->id, ret);
		return;
	}

	offset = field->report_offset + usage->usage_index * field->report_size;
	data->function_row_physmap[fn_key - MIN_FN_ROW_KEY] =
		hid_field_extract(hdev, buf + 1, offset, field->report_size);

Thanks.

-- 
Dmitry
