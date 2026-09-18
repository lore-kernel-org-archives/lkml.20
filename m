Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED672479890
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766333; cv=none; b=KOCHoplDIrmnw+6QQpqW4H4utc2Q9F7n9gcGq3U2NDaQp1z1ZQPGDFendAlhdzIxwszq2WD0sXjp6h0KVGHL6wfd+PSBw1uoh2CN8lAigpW932h/ZXIVx4ilibBERgITpy0XGuX6HCntdmNzqiWCj15fvyGwnsfrWkugz15uLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766333; c=relaxed/simple;
	bh=Lovxf9/OZwSdlztHvA8OyntDfii6WbEpsCIzxxCnNIo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVPs5KKABAfbPv/ZbN4eJD0JhJdV/6F2Sf00jabJ7YRD3mFSipdv0o/JmRAMZkqWSra7FZJStqxZULtIjRKzf/VFe3h46+gUqsMlvG/hfa7kl6acRsHiqbihhBy3k83pCsY9SDm+c5Ss5AGRn8lCss4jbGg7VwxAMpxIAJDHdWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAVRwI1R; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAVRwI1R"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8e6bbso616312d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789766331; x=1790371131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=981K/DGg/xv+r6hCcK9Ai2U7Tk2PZGl7LeSIC71KBGE=;
        b=AAVRwI1RjKi7hGob3hoJlUd8bi2jNAKpDi1XLjDuxRaYhfiLMbs/MXUzJaztQsODcu
         b9AplWKCTWe7O7Z8YCxPnnw6j0edVSH6/dxYSWZ/bMkurwd0zwziLgBeV1YILMb3VAsI
         j7mZPYNVc5mtaxRHk2KkOWhzNhmz675+8nJFVevpBJHN42+W5xF1f1hqQG1kgooAzEmH
         jjwcZ+pxvXstiBP5C5VehBdG7m5Qri4ZkOjEvRWwGQtWAQqsXcIg5SuIza44sw75bVN4
         diaT/HVtNJBSRpkgNS1X9rN5GtFNvp3ihX7feBlHARUU0tEHPejZUXd06nGWfIRoW1YU
         Ax3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766331; x=1790371131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=981K/DGg/xv+r6hCcK9Ai2U7Tk2PZGl7LeSIC71KBGE=;
        b=aLlh7zR6lzXmcuIDqBCZMDyL0LW+lVm+sSt0FhV+IbK+YcjOR8zWjOjIWqNlpPOIjw
         EFsolRwIoZdwsDQtysHBbBtdlT672JvCBl/p2tfXcqz8WO9F7daBbcAVSn4KFcEx/GRq
         //DPubyqH4wiSEuozNKzhmNY7nFSdv2cOIsvjEV04imZwe/bp2QCIFE6BxvVtpyihbbj
         dBuNADaCsTraWLDuPUAseEcz9GcdNjMLke1Um/t05VOEwzspq6zXK2j4g1YiTYZvpDdD
         qJljYhaMyB2617zrLSV1RaKfaeJq1o5uNX2/Vg0KXjjA+uiLb9R1CVoTL4qKDzI59hkw
         Ph+w==
X-Forwarded-Encrypted: i=1; AKwUvBzCAppNTdq6AmEuFueknMATDTKTyx40o5g19cs8W9XRkRywM8CxtNaH4pecWOsgct/DjfpCGRyZz4VePwI=@vger.kernel.org
X-Gm-Message-State: AFuF++ks4xhVYaXYKrUfkXk42tJ1N4PNmvM1APPz5Yw5gxSPXzGSaTgl
	mlYq9OnoLeD+1MHyKhDp0orsHbD9DqfAS5D9p+j/kSRXrKUPpx0wTdww
X-Gm-Gg: AYBFou32uGMYGJJxMqmNuLQ+lEmFDHsxTaBzTEodUGFBUI8YUiT8LSepS657e0oEb2+
	xtsTzG3ZS/12Ufid1cBmzk7o2KLPr6fs3xRHnDan7UgpoBNBFLLmHBBi2SWPU0DuJ8iN5z6dO2K
	QTGPXlPGrIgdmxghAi1a0xIWe+j0xgD/6QoyZLuJJN3JLTlkbfnPdpuB6u52xPntWHpKwM+rdZt
	fNFM50Vkz2Y8yKlQpes2XT6WwMmfGZze5c67IluZ51vKl/fguBc7V6uLYR6BjDH0mw+20GA1MrA
	wjnXKv0S4NCRKPSj0phqemIkLSDwjSq+uSAvp+oc7d48IlJWzCB9CsNR9lioWC6PQZ5sjV4PRXF
	AK3IdW1hQtild9LbbGAule/BzDaEaOiN65b+3p2kaUEv1Ph1ovySGBf4eI4rH+AkSg2KAveiWFC
	DkKGKuSGrzhYUHoiFwecSjjeHOR4aSRVTWngPetELUoNWhM8UFSwIdqY8iOSEDsWuE5ov0zEZzA
	tDVHuhHnQJs+zliONWknZMVRQ/u3CnQNo8Hh7lpRsR9p6Gslg==
X-Received: by 2002:a05:690e:191e:b0:671:7f4:ac68 with SMTP id 956f58d0204a3-6717fe10e31mr1105271d50.18.1789766330726;
        Fri, 18 Sep 2026 14:18:50 -0700 (PDT)
Received: from 4470NRD-ASU.ssi.samsung.com ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67299104e3bsm484197d50.15.2026.09.18.14.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:18:49 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Fri, 18 Sep 2026 14:18:46 -0700
To: Gaobin Huang <huanggaobin23@semi.ac.cn>
Cc: Ira Weiny <iweiny@kernel.org>, linux-cxl@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>, Li Ming <ming.li@zohomail.com>,
	Richard Cheng <icheng@nvidia.com>, linux-kernel@vger.kernel.org,
	Anisa Su <anisa.su887@gmail.com>
Subject: Re: [PATCH RESEND] cxl/mbox: validate the DCD extent list counts
 against the payload
Message-ID: <aq2qtqtPN97Kffvr@4470NRD-ASU.ssi.samsung.com>
References: <20260917104656.2658591-1-huanggaobin23@semi.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917104656.2658591-1-huanggaobin23@semi.ac.cn>

On Thu, Sep 17, 2026 at 06:46:56PM +0800, Gaobin Huang wrote:
> __cxl_process_extent_list() trusts two counts from the Get DC Extent List
> response: returned_extent_count bounds the loop over the flexible
> extents->extent[] array, and total_extent_count decides when the enclosing
> do/while is finished.  Neither is compared against what the device
> actually returned, and the command is only issued with .min_out = 1.
> 
> A device that reports more extents than it delivered walks the loop past
> the end of the mailbox buffer.  A device that reports a large total while
> returning nothing makes the loop spin forever, because total_read never
> reaches total_expected; a stable generation number and total also keep the
> existing -EAGAIN check from firing.  The caller cannot recover from that
> one: __cxl_process_extent_list() never returns, so the retry loop around
> it never runs.
> 
> Derive the bound from mbox_cmd.size_out, clamp the claim to it, and fail
> with -EIO when the device stops making progress.  min_out is smaller than
> the response header, so the subtraction needs the same underflow guard.
> 
Hello Gaobin,

As Jonathan mentioned in his reply, specific debug info does not need to be
included in the commit message. I would suggest adding this kind of information
to a cover letter.

> Seen with QEMU emulating a device that lies.  The response header is 16
> bytes and an extent is 40, so a 2048 byte mailbox buffer holds 50:
> 
> 	BUG: KASAN: slab-out-of-bounds in cxl_validate_extent+0xca/0x310
> 	Read of size 2 at addr ffff888005758800 by task sh/1
> 	 cxl_validate_extent+0xca/0x310
> 	 cxl_process_extent_list+0x2c1/0x430
> 	 cxl_region_probe+0xb2b/0xc40
> 	 which belongs to the cache kmalloc-2k of size 2048
> 
> The Read of size 2 is extent->shared_extn_seq.  extent[50] starts at
> 16 + 50 * 40 = 2016 and the field is 32 bytes into the record, so that
> read is the first byte outside the buffer; a claimed count of 50 stays
> inside and 51 does not, as the sweep shows.  Reporting
> total_extent_count = 100000 with returned_extent_count = 0 instead spins
> region bring-up until the guest stops answering console commands; with the
> fix it logs "Extent list: no progress after 0/100000" and fails.
> 
> This is in the dynamic capacity device series under review (branch
> dcd-v6-2025-04-13 of weiny2/linux-kernel, based on 6.15-rc2), so the fix
> belongs in that series before it is merged.
> 

Ira has dropped the DCD series and I have continued to work on it. The last
revision is here:
https://lore.kernel.org/linux-cxl/20260625112638.550691-1-anisa.su@samsung.com/

Sashiko reported the same issue on the previous revision:
https://lore.kernel.org/linux-cxl/20260625183203.3042C1F000E9@smtp.kernel.org/
and I have already patched it in my working tree.

I plan to post the next revision after the DCD Prep Series is complete:
https://lore.kernel.org/linux-cxl/20260918203049.7273-1-anisa.su@samsung.com/T/#t

You are welcome to review both. FYI, if you would like to keep up-to-date with
community news, there is a monthly meeting at 11AM PST every 3rd Tuesday of the
month. So the next one is Tuesday October 20 11AM PST. If you would like to
attend, I can forward the invite to you.

> Signed-off-by: Gaobin Huang <huanggaobin23@semi.ac.cn>
> ---
> Resend note: the patch is byte-for-byte unchanged.  v1 went to
> ira.weiny@intel.com, which no longer exists, so the author it is addressed to
> never received it.  The v2 revision of the linux-cxl patch (drop the Fixes:
> tag, struct_offset(), fail on a response too short for the header) does not
> apply to this one: this code is not in mainline, so there is no commit to point
> a Fixes: at, and the bound here already guards the subtraction against wrap.
> 
If the original send failed and did not make it to the mailing list, there's no
need to prefix this patch with RESEND.

Thanks,
Anisa
>  drivers/cxl/core/mbox.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> index 0b51a5d..c12ff86 100644
> --- a/drivers/cxl/core/mbox.c
> +++ b/drivers/cxl/core/mbox.c
> @@ -1764,6 +1764,7 @@ static int __cxl_process_extent_list(struct cxl_endpoint_decoder *cxled)
>  	struct device *dev = mds->cxlds.dev;
>  	struct cxl_mbox_cmd mbox_cmd;
>  	u32 max_extent_count;
> +	size_t extents_hdr, max_returned;
>  	int latched_rc = 0;
>  	bool first = true;
>  
> @@ -1808,7 +1809,24 @@ static int __cxl_process_extent_list(struct cxl_endpoint_decoder *cxled)
>  			first = false;
>  		}
>  
> +		/*
> +		 * The returned count is device-supplied: never index
> +		 * extent[] past the payload the device actually returned.
> +		 * The device also chooses the reported length and may return a
> +		 * response shorter than the header (min_out is 1), so derive the
> +		 * bound without underflowing.
> +		 */
> +		extents_hdr = offsetof(struct cxl_mbox_get_extent_out, extent);
> +		max_returned = mbox_cmd.size_out > extents_hdr ?
> +			       (mbox_cmd.size_out - extents_hdr) /
> +			       sizeof(struct cxl_extent) : 0;
>  		nr_returned = le32_to_cpu(extents->returned_extent_count);
> +		if (nr_returned > max_returned) {
> +			dev_warn_ratelimited(dev,
> +					     "Extent list: device claimed %u extents but the payload holds %zu\n",
> +					     nr_returned, max_returned);
> +			nr_returned = max_returned;
> +		}
>  		total_read += nr_returned;
>  		current_total = le32_to_cpu(extents->total_extent_count);
>  		current_gen_num = le32_to_cpu(extents->generation_num);
> @@ -1823,6 +1841,18 @@ static int __cxl_process_extent_list(struct cxl_endpoint_decoder *cxled)
>  			return -EAGAIN;
>  		}
>  
> +		/*
> +		 * A device that keeps claiming more extents without ever
> +		 * delivering any would otherwise spin this loop forever
> +		 * (the outer retry cannot help: this call never returns).
> +		 */
> +		if (!nr_returned && total_expected > total_read) {
> +			dev_warn_ratelimited(dev,
> +					     "Extent list: no progress after %u/%u extents; aborting\n",
> +					     total_read, total_expected);
> +			return -EIO;
> +		}
> +
>  		for (int i = 0; i < nr_returned ; i++) {
>  			struct cxl_extent *extent = &extents->extent[i];
>  
> -- 
> 2.34.1
> 
