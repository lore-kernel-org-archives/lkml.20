Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070414;
	b=X6Q//UOV80H5dw3T4N88Ofe6nD91154Gt1M7AxmUPCw8Xv2e489k8nDCHfY19n8NW/Cc
	 11eOsl+yTUY31E/eNvtJaQ0U0zZlfys7Eg1Vj+qeStx9p3Fzu4hjMAiVuEosanbxFaVuf
	 r0Ic9IvPu9KfMvey4Sh0vRdxHX6qotxTvgUxR9/Q/wYRAsrXzs5IHGIHKNfBQJjLjOOit
	 HmfgClxzmIOsQ0QFlrkpQbZRrWFsiHOU5ed/je0AjHKSTLP6UsDPxW2eQfUz0uig+QnmM
	 jIuxexbzWrSkS7Al2d+E1CPUDXYv0i82tQRKslW5s58mC4gOk15y9nFZ1THh7nPSdjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=QB27yEBKtA/xKDE4Lpw6rAITC1mnPekLzcQwjnT1UyY=;
	b=s9yQcWXYv6aGURD/oyweDr1fB7Uj+bu+TNY3kRXgGaQ5/wn8+nrhr/1RAaBLbR8yg7Qq
	 c0ICXivZnIaEaZNk1qpiJbpX8ixQOBgaBySk5Ss6j9bbz5NF4C7Zp0VEmo2zrnkdw3arz
	 1djyPwHg+VPl6b4Bq73SyYV79iY1zW8P5Z31rQxGIT6Cl5W+IRaCt5cfeHC9kY43egsz7
	 otoL4OkzbKyjdSw6Fa05XphvQRo0d7xugL3wN4Xta+EYRqPfXzf2QenMmCXYfjnZJPdyy
	 iMfF2hTm17RAIrJmRZiN8baxOvniI4NIUilZwDoU9WlL1ifStRJ3fFRSw8hPv8nVsOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rgTQ9eRx;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D53606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D53606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rgTQ9eRx
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so2070007eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793070412; x=1793675212; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QB27yEBKtA/xKDE4Lpw6rAITC1mnPekLzcQwjnT1UyY=;
        b=rgTQ9eRxSMvwGrirkI272WKRq8mYyvay3ISAHS88evRz97/bTokaePHOPal77r0wIz
         AlL8+2mukmMD9ySrQgDSG644ywd2Q+LvgGN0pwcr8RdSnB7/4dVFTjKeyEY/jROSM7R6
         QH4I0SJ9f40CzkRBYUn2pSyyjCsseY/rAVMOR5IO6R4ajvdkvBRQ3BVH07tTL1ndJyl5
         /i4UEj7QbwDb1W2Ltaxm1DCaHkWDL8awCI9bp2vxq/Wg8xc1oytJd35qDQ2mYjdYZXUp
         5+mK6sfCJgZHmpRq3+60EFt3VN2Vs980U0reSl2nKgj/f+IS1RQ9bkTVu1LKILb2rPEz
         ChKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793070412; x=1793675212;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QB27yEBKtA/xKDE4Lpw6rAITC1mnPekLzcQwjnT1UyY=;
        b=DU32+IsGcJqHA4y6+28KEgFVL9rRoUUmIBIdfifeTsJsZ1tgjA2LgESq2IalidyAz9
         rjEuJIqbcKdlsia6FEpKrSwwpqwOBtr391sn58ZpRcWa5rxcVGpMripYjZZhXj3mkvzn
         9qIU40DqVXEdV3H+rsXkOxKkGcKvK79yfUCZT/TbTy6ebx22oix8cHkBnNu07wCuYlI8
         3DD0uD6TsOWwl0ylN/R35L/JrgerJtW+b4016tC6QwEVYs0Pniw1kP6falCcLISbmnqy
         iZqp38Ct6DdatNlaAsCRq9MWV7/1fIuYP3v0v6dlFpgf7v3Mg6bDRVwL8EIQibcXWSD7
         BtSA==
X-Forwarded-Encrypted: i=1; AKwUvBxv/+eMHOhHMk314j6I9NYpx/5eZH2Z5G1BoJBZfB3b0q3mCK6N4GpyDbxlsn7ZYFo2hW8QPoD2QsLOxJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmv33sVD9cueLzD9urn2HTwZdIITOQ8VBLt07A7PE4HPy3k17e
	PrMdzQjLO7iIpsHyxORzMe9yjVsEICvWC8E0dwNdny2XFOTYNs1YeCLO
X-Gm-Gg: AYBFou1IMMalVz35ljbHTsTMEnuCOJl8VIK8q2mGrcneLLtA3GcZPdq+go56ZsBNljp
	ga4KmqQrJ7G/kikT7qlbfd6tCXwdd2QBiAeUs17m3QoHL0k0HtZb3Zo4elGU3qxrsNFhQ+roO7D
	ubabLjHV5Viy+mTIoeRaSlDKA3uXepiSvQUYOrps5BRGXSFM3CqWTDv9HZJ17x8tCLLhhG1L+n/
	hCtNpm0i+izmhr4S4zRjptDqzb5Q15gOdOOf75uVLjNRr4pMl75kO+qLpDaoc9nKRDg/S+fpTaN
	qf/bCME7PrjhkDVwga/TVDQkd7uy6IBC4cYJsY1Mkt9akWaw8Y61of8fVm6a8jA/gHp2yFfsarA
	IiarvB9rCymzjKCDilKLHuhcf9Qaspns0XFMdle5iypzesLgWLSJy1Yi8gmgS72NMEOL9nZI6Mj
	Jc3tsxqRrnqy862+DzfcFa81xyKtyTgtyafIRNcxzBSJcXlog7RvHL78EV2y+8lBd7diNij2py9
	OPufBJhBAUwaBhD3qF9jPkXTYOuauSpeHMoTXN4iC35zIl6uhhR5wqM9IvN2DJXS65RZY1y55TY
	c0v9rxidJKBc//IZlL6PxwKFAMfLs/0JfkMbr9c6IIsburVb04LWxUZw0E9t0hiEfCJ7nA==
X-Received: by 2002:a05:693c:20ce:10b0:343:9eb1:9940 with SMTP id 5a478bee46e88-369e849d12fmr12565801eec.26.1793070412156;
        Mon, 26 Oct 2026 20:06:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a11b45b8csm2998795eec.17.2026.10.26.20.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:06:51 -0700 (PDT)
Date: Mon, 26 Oct 2026 20:06:50 -0700
Message-ID: <9499ecc052d84c2c015a27e8e1f34f0a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard controller
In-Reply-To: <35aef2ab2b6607a46eaa0105e8b13c7ba60e5509.camel@rong.moe>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com> <35aef2ab2b6607a46eaa0105e8b13c7ba60e5509.camel@rong.moe>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Rong,

On Sun, Oct 25, 2026 at 10:25:46AM +0800, Rong Zhang wrote:
> > +static const struct input_device_id ideapad_tpswitch_ids[] = {
> > +	{
> > +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> > +				INPUT_DEVICE_ID_MATCH_KEYBIT |
> > +				INPUT_DEVICE_ID_MATCH_ABSBIT,
> > +		.bustype = BUS_I8042,
> > +		.vendor = 0x0002,
>
> Missing INPUT_DEVICE_ID_MATCH_BUS and INPUT_DEVICE_ID_MATCH_VENDOR?
>
> Other than that and the module parameter's name, the patch looks good to
> me. With them fixed:
>
> Reviewed-by: Rong Zhang <i@rong.moe>
> Tested-by: Rong Zhang <i@rong.moe> # not matching other touchpads

Indeed, well spotted! I have added the missing match flags and your tags
in v4.

Thanks.

-- 
Dmitry
