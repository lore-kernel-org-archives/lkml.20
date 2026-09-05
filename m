Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2189927A916
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575841; cv=none; b=n7GtQ+wBU/CFYC6TjSYceyngnVcb+df6kTgd5TQ4TCXTEVcCPRg4bePvk6sZQVPaMYnaZJySK4b80iLYtuuutTkC6Pq4OL7/0k1zFx73nKhLWqd2XJ1WOw6JUYcwJsZuZAzmJGsJRG3JIlgB0b2GzZbSg+69CRF8jfbKUblaFfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575841; c=relaxed/simple;
	bh=wquW73nnBwWT6XnD+X/Pe7ShK7x7XDj8Y7JBFd/eb/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxTHsyVQQfiHlZBFSbArC9z9dAfJKjox6EzexXZqiJAVk+73IQ6yt+iz3q+7C04BttA7DHCNdD1fS8EEB5jbbsHGC7Sdyt+CjZyt71lE6Y5Xm8JIPK75iuD+NZoJA5gaUZAh9rGDsQbgQBFDjOqIKzYNgcoN5Dsw7GByL6CBr24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kFvZp8Ge; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kFvZp8Ge"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52f83889a93so20461291cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788575839; x=1789180639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9w9CEy1DQ4ao93Pe4ROwaoUm/boruq1IRty3oKe6EUU=;
        b=kFvZp8GeJt+dxSRLgvQ3t+Dx3U7qM72zhme6hYyVbLWdoc1trdrLswWsw17loWdits
         zmNgfG05ovuBHX9oNVLLM1fy1a9gYBv2aN+I2horU1L7oHuuvS6hIdexPKUfHuoALHxf
         JbY7NhzUwBalqtVMfSOCm+PV0ctep1PfsWPCmToBSallndG3gqpBIUP1iarRwPguUEhI
         CqNqaKhY7WMuSQNktxtP2PYvDqBYg7/Etu6UaQ916dMMvTBPlMod9UuxSEmSpqPWGrc3
         kYpD8GzgXMhjM7a9pganKBWWh6NeOU+urCxDTl+4yuDC9vFcyKtwhf9Jdz3z0iiaUjzq
         SKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788575839; x=1789180639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9w9CEy1DQ4ao93Pe4ROwaoUm/boruq1IRty3oKe6EUU=;
        b=o6K7Oztf69/vYjeHmdUdiu9dmFBrVR6fUsHBSkGx05c1wualjN+vUQRrObrLFxbj1q
         WyQmOLMmlSl/13o8Ewl3azNvTiCTMJ5bOPT1nOb39S1H9ol+OHiXQTV20UazImudXeqK
         kWQahgwcO9y4FBCKTQ8IiJtTgKtvzCBLMn2v5RULeDh1DG/X0OVLJ9erU7HyVS3KbXvW
         mgYbiPIgHdJGfqKZl7PmydxLrkuB9vPgo+xi5YWZ+6VMkQupPFH2/pfRLrzgjDc3XqFQ
         GJDwNdGknNQ+7ehz8Shy+Oyb2WwsGL4LES8ruwsvd8OweZ973Um/w0R30nljfGnM2Vla
         zXxw==
X-Forwarded-Encrypted: i=1; AKwUvByDH9jFCxs24oCp5A/JuURsBHxr8Kh7mbEqOYcPzAMB2hmSgKpDpG2enmpM54kiy5mgQQK9QCAsIArT0oc=@vger.kernel.org
X-Gm-Message-State: AFuF++l0kTXs+qFFkHYmQ6aeaKEJC80b5RJpy66ROIcqPcEis4lDrcSp
	Gn6nEKCCse+UpqUpkxQmgKedRjHFnXCeNwh0+c0DJkU/xBgvar2XV2R+svD1iiD98A==
X-Gm-Gg: AYBFou01KWS1fAiNBib/s1Pe2C1hI7S/Cra+XWC5Or84AnsbA4Gg2XIIsEMc0arVd6b
	zYeOUQfXSatFoiEiklnLphrFs96CvDbV8GUDQOfsREk51N4VMg5b7yOAkwd66q4DafKbz13TRPM
	q7gINFVJpBF6h9tKoutpnwLmllCMzBSNxfxDGUhjEfq6J4l6dBopCBJe1ZYM9EuGChT6HMtfU2D
	NJ7beJHSraPvWceQj59zvYEzAoV203YW5pBiRQpMVXvfUclrVQdI6qvXhJxXMlNhYSK+Vc/yjZv
	pMCgU37kej2yUoM7X7edJN7AWq2mYEEDXgVhea8jTUnllOLQqCsr13d97bM5QjfMgqyuj9YYDBt
	D2n7fgP/0OdW6w/XIIBBTWNI+Tt0L+A5fLDdTTrmTZJulP2tDDjxeoZsbZcKt8IQghSi7oBh7dn
	iAqrXEhsnpGEr3VsVbV8SfWPk92Iy8L9N2OTzq3CHKWeR5ruYlCxuN8V+gfNmdI50=
X-Received: by 2002:a05:622a:411b:b0:530:4310:53a3 with SMTP id d75a77b69052e-53054a34ee4mr115702161cf.48.1788575838780;
        Fri, 04 Sep 2026 19:37:18 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406bf8c3sm35302066d6.48.2026.09.04.19.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 19:37:18 -0700 (PDT)
Date: Fri, 4 Sep 2026 22:37:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Arka Mondal <arka@arkamondal.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
	Daniel Drake <dsd@gentoo.org>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	arkamondalofficial@gmail.com
Subject: Re: [PATCH 0/3] usb-storage: alauda: fix DMA from the stack and two
 block-map bugs
Message-ID: <0a60fe87-181a-405f-a758-90883ea7c60e@rowland.harvard.edu>
References: <20260901065831.43567-1-arka@arkamondal.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901065831.43567-1-arka@arkamondal.net>

On Tue, Sep 01, 2026 at 03:58:28PM +0900, Arka Mondal wrote:
> The alauda subdriver builds its commands in stack arrays and passes them
> to usb_stor_bulk_transfer_buf(). usb_hcd_map_urb_for_dma() rejects a
> buffer on the stack, so on a host controller that uses DMA every alauda
> command fails. Patch 1 moves the buffers to us->iobuf.
> 
> The first command to fail is the one that builds the block map, and
> alauda_ensure_map_for_zone() ignores that failure, so the next access
> dereferences a NULL map. Patch 2 checks it.
> 
> Separately, the zone index used to reach those maps can be num_zones,
> one element past the end of both arrays, because max_lba counts physical
> blocks while the index is computed from usable ones. Patch 3 bounds it.
> 
> Alan Stern <stern@rowland.harvard.edu> wrote an equivalent fix for
> patch 1 in 2023, attachment 305027 on the bug below, and offered to let
> me post it. Patch 1 here uses us->iobuf directly, as the other
> usb-storage subdrivers do, rather than the memcpy that attachment uses.
> Alan also diagnosed the NULL dereference in comment 11 of that bug, and
> suggested the reordering that is half of patch 3.
> 
> None of this makes the card reader work. Alan has said it may be better
> to mark the driver BROKEN; that is a separate decision, and these are
> bugs in the code either way.
> 
> Compile tested only; no relevant hardware available.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217862
> Link: https://lore.kernel.org/linux-usb/20260821080951.39905-1-arkamondalofficial@gmail.com/
> 
> Arka Mondal (3):
>   usb-storage: alauda: do not do DMA from the stack
>   usb-storage: alauda: check the return value of alauda_read_map()
>   usb-storage: alauda: fix out-of-bounds zone index
> 
>  drivers/usb/storage/alauda.c | 95 +++++++++++++++++++++++++-----------
>  1 file changed, 67 insertions(+), 28 deletions(-)

For all three patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>


