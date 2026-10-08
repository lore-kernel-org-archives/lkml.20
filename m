Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F24361962
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487399; cv=none; b=hJqZKgs/y/uM3j9aSsKvYzIb40iGt8atAFXO3l9XUymJLmCiB5FhWqJq1YwrvCzE/WJqEIqvYC5m2p+ei6CzyvAn0MUJKjQSHp+nMvRFrSc0mbRQkYcLIUGa46Z2Wu0joqICLCy+HKmhrkReX13fAu+A8+MI45myDUXdP9yedvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487399; c=relaxed/simple;
	bh=TqrV26qwnEQgYssaPOFp21VF1XSCiSFJ7XsLPRkDNxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9BQSS67Dqhd1o6xd/anb2YdRBQcggbxRgkeN14ZvpZs5zU5QRJ2kx5iYTJ9JUdKigrrnhKvTsMa4/WD6BVUvSNz7dFYL5ZtU2UsvKKVIch7qT3MUeNk2SzKArwStb3yHdgmdfwEDPTnDNb8cfVa9PiLf7bHd51VYur7eSgNS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5E8m/2f; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5E8m/2f"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3164047eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487397; x=1792092197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zt6yAaoBJC8VH8i4bJ6fKJQa1AiavMR0bK+hKvjahgk=;
        b=F5E8m/2fZ3yIKoIXeeK/3wOe4I/PrQyuTF6QiBtiKnJ6N/vYKU8SZ3PkyYTapBkgle
         xQg5gfGhO0jUsXVA8CdatlyxgX8Nvk+8PHY6LTEk7vItHqsrqvWAot+EZ05/+5mTUEKd
         shzWSnd7u6lSoEJbjNXCLufO7Jue9UV6L150PjkseTk1ucyIFt+dThJbuXpjU3k1nZjg
         HNjF6BltA9bMMM1XT98mY7TG+PiW74v4+9d3lQgO+6Kku43VYX7ecjPUjnRIrPlGIFSi
         FyRm6Sj8BGfGdbOwvbiyJJ58h22EHzXQsfTgquR64MRYphQgjB8VCBF577ZMpL5Dp84R
         eB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487397; x=1792092197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zt6yAaoBJC8VH8i4bJ6fKJQa1AiavMR0bK+hKvjahgk=;
        b=wAUJoZurdheExVnTIxhhllGiw1gDjmmCpvjaKVjdkRYgE+S4THo782B6INwHDeaQ3Y
         bYV66WyHEVSdopxKoPycE7P6/NVciy8QvPVDidtEDyAmvHH+A2Dxlg8dgrqgBeMH3ZK2
         etgwWBjX46hB68B4HC/jC0SJqAU0JXpn4OJdjvanCURgSiOBQiE+VZQu9VzXAVGaA88g
         OMqe1QjOwInB60qDTWHg8g3YkNJbCrLt+eU8s7Z5R16eEZan/QchA+dnqxNmwd71snXS
         u1OjdyS8aOLDNRgjeB5aA85iAt4xW3pYfP/JzLk1aecUWPzPvJ8gawQKxmuIbjTKktHT
         ltGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMjT+kjXRKuDny/m5UWoyCN2kPoDyoVVinx9GQW+ktRluGNuqnzXvur0zs2P+yTkfbXlJelTSC8U7AsI4=@vger.kernel.org
X-Gm-Message-State: AFuF++l4wgJWFXHDv3COjoWTfinRizXFpqxTE+XbS1WPlx/+akticrlZ
	vLrqIDAsBnKPIlNAZP8obH/H0lBjAjHnRC5XGKC16uOf45Jun5n34d13
X-Gm-Gg: AYBFou0NYWm6rfQt4HR4Sg40iKmEYs6l27SfvHj3h9nM5O03qo0evuuOKvaB63JQ+iO
	58LG1QuRJg2nFsapXQkFOaetp+GGsHZHRcLjPEs0fIDwifLcoX28R3M9nyUVHLGbnWa/tnvWO3a
	hPRUn9XRRXjQ8eELwF6bJNnp3+j30T8zijKQRkHY/AvcDOUpEWceOF80jh4q32JmBuALbR9nJV5
	3dntC3ilQbpZMNEA8c0HiBYfoPFGnOCezlqRTz8qqIBChbz1d5hVVbEpaYRZuMxLKCJOL1/tkNJ
	VPwqT/TkJZAz/6tpTvtB+L19kPpMo8az3YmQPf9jSWGCQMTumLqC4Ws+0PaxM/FroImSnBhpyv2
	Iw9/A+uy/zFLkfEVSWeb3ZFFDUMGOsM/D3JqUJYFKjLfqTF6WcEtJ40FJpBmMgvkQXNd6S+TR4C
	8IIaWM4ArIwGcPJrsWC7nHtoX5AgpgDhbKcBDegeHoR/LAc1FSEFqid5oRb4v6rfau2q6I7Y5tF
	6L7NKsLWWY0a8SE+ZIk7z6+FH/QEbhKyz/23sFa
X-Received: by 2002:a05:7301:670c:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-3515de80f23mr10101112eec.9.1791487396733;
        Thu, 08 Oct 2026 12:23:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm98286eec.14.2026.10.08.12.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:23:15 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:23:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: shashikiranah@chromium.org
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Stephen Boyd <swboyd@chromium.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>, 
	Sean O'Brien <seobrien@chromium.org>
Subject: Re: [PATCH] HID: vivaldi: Validate Report ID and length in feature
 mapping
Message-ID: <asfk_jRVjY8pXzjt@google.com>
References: <20261006-upstream-vivaldi-fix-v1-1-bbc9a7f14ea6@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-upstream-vivaldi-fix-v1-1-bbc9a7f14ea6@chromium.org>

Hi Shashikirana,

On Tue, Oct 06, 2026 at 03:06:59PM +0000, Shashikirana H K via B4 Relay wrote:
> From: Shashikirana H K <shashikiranah@chromium.org>
> 
> vivaldi_feature_mapping() currently passes the descriptor-declared
> report_len as the received data size to hid_report_raw_event() instead
> of the actual number of bytes returned by hid_hw_raw_request(). It also
> does not verify that the returned Report ID matches the requested
> report->id, or handle a zero-byte return before decrementing the length
> for unnumbered reports.
> 
> Validate that hid_hw_raw_request() returns at least one byte and that
> the returned Report ID matches report->id, and pass the actual received
> byte count (ret) to hid_report_raw_event().
> 
> Fixes: 33bbe04a15f2 ("HID: google: extract Vivaldi hid feature mapping for use in hid-hammer")
> Cc: Tzung-Bi Shih <tzungbi@chromium.org>
> Cc: Sean O'Brien <seobrien@chromium.org>
> Signed-off-by: Shashikirana H K <shashikiranah@chromium.org>
> ---
> Change-Id: I3cf03bd2457f44c6ed47835f3d603f235f5993de
> ---
>  drivers/hid/hid-vivaldi-common.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-vivaldi-common.c b/drivers/hid/hid-vivaldi-common.c
> index b12bb5cc091aa..ea2c661e623d1 100644
> --- a/drivers/hid/hid-vivaldi-common.c
> +++ b/drivers/hid/hid-vivaldi-common.c
> @@ -69,12 +69,18 @@ void vivaldi_feature_mapping(struct hid_device *hdev,
>  	ret = hid_hw_raw_request(hdev, report->id, report_data,
>  				 report_len, HID_FEATURE_REPORT,
>  				 HID_REQ_GET_REPORT);
> -	if (ret < 0) {
> +	if (ret <= 0) {
>  		dev_warn(&hdev->dev, "failed to fetch feature %d\n",
>  			 field->report->id);
>  		goto out;
>  	}
>  
> +	if (report->id && report_data[0] != report->id) {

I do not think checking whether report is numbered is needed. While
transports handle numbered and non-numbered reports differently here I
believe we always have report number (0 for unnumbered) in first byte.

Also, shouldn't this check be in hid core if it is needed?

> +		dev_warn(&hdev->dev, "report ID mismatch: expected %d got %d\n",
> +			 report->id, report_data[0]);
> +		goto out;
> +	}
> +
>  	if (!report->id) {
>  		/*
>  		 * Undo the damage from hid_hw_raw_request() for unnumbered
> @@ -82,10 +88,11 @@ void vivaldi_feature_mapping(struct hid_device *hdev,
>  		 */
>  		report_data++;
>  		report_len--;
> +		ret--;
>  	}
>  
>  	ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, report_data,
> -				   report_len, report_len, 0);
> +				   report_len, ret, 0);

Devices typically do not return short reports. Could you please tell me
what prompted this change?

Thanks.

-- 
Dmitry
