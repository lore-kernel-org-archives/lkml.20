Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637225;
	b=I6EiwsJa/3rvjLjQG6+w3bdMn3dQBUmY3BWA53o450UAhwp1YEsnuadjXo+vXcm9iq7/
	 iMx4AKYNRZ3NzFQetbPhFhC4VD0tUOAM22keev8XBlAh8lKJMNg+1aBFTbLoJv2P32qNz
	 Jwa8SHM+FMOSUVeXnlyb1Wmu+Pb4qaFx3vWWzeA7ER9OQstWgDgN/r9ow/mrPNTqMSU3M
	 JNDliKVTJTcKPZTCXGLROe4+FX2i6aG/m5MS3Z/0nqPVzRkuDpl7CnAZunprDYnLn4KUm
	 LUuXqcDLWhti1tgbJqQeEHZWAfHIIViUbupaN/i0q/0Ajx4a5jc0rvNu3z52E/Ol6Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637225;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bZDM7pjFprraJZ4e9RLnqLxhxQi43j49i/Xcsi5OwC4=;
	b=bNIblBFKNvFjADmk5kP53AdspwB/55ltLdjws6K1Gurm7HtmOEK2jhCpS82WyqxByWmo
	 kApTbJEgjrwfw5+hpP3pu6kiE97yRdr+WP590DbH8sp4s/6W7ggknJUp4pbhuAWfZ0RAq
	 1xhmV/ViwyC8RWA7OZI8//zQe5/3wmM3BnXmTWbHzZX+dsIFxcM/9WeOLqcCELb+wWuk5
	 19NjQQEyysErVuPkjcIHFZ04e3BZLeiD7Urd3QJXR7RyLJI/swtKg7XI9PBX8e+5NRjzY
	 bTvgNng1wD1ct5JRgrHjREgmbrPamlJYOfz1n8nhyca0qVxfFcgewgDlpotRO5CDVYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V71Xzz+P;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hdWOi1K5;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC3606B0D4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BAC3606B0D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V71Xzz+P;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hdWOi1K5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793637224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bZDM7pjFprraJZ4e9RLnqLxhxQi43j49i/Xcsi5OwC4=;
	b=V71Xzz+PVUdwC3u1S70sRjYPCmmeNxnLrA3oNETGGbgvkCYXaePKYqniRc5+9+NDg8q8Nh
	RIYYMLZG2xECIRcRyIxaBl7X0CgXJLYb7d34OGqpMmUivl50farcsONuo5cQqHXnPVnoFX
	EjJIpIWnSohv1DEut1rAU/wRYiCe67M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-TYTeMlhHN1iIBohdbJ7mbQ-1; Mon, 02 Nov 2026 11:33:42 -0500
X-MC-Unique: TYTeMlhHN1iIBohdbJ7mbQ-1
X-Mimecast-MFC-AGG-ID: TYTeMlhHN1iIBohdbJ7mbQ_1793637221
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e1ad3cb66so2255039f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793637221; x=1794242021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZDM7pjFprraJZ4e9RLnqLxhxQi43j49i/Xcsi5OwC4=;
        b=hdWOi1K5Rt4fY3wUvl6SM0n4EoS5qVNvtjTcBHodW6OKuOdWzHE1EIXvDCyG8wlKnC
         0W0JFJDRGrb8meoO0QvTu0PgSbP0Vdd5mlsBXBkM1OB/TfXR+p/WrhLDBOMNeYpLgN2p
         Z/K5EyBlox8ImybpREjqAyGMjAaMqQPFi6gxOzxerfubgMmAhbivf6EYf/zds2CJAt8l
         REdDemdTU0uL7uqBkuGGt6r0EGUar9G5wBq3d7kwjzs29Pu/On6UXIx9aLuMwPB5fzBI
         WG3RiYxseXvItGU0aQxhKJJciwz6EQ5i3tZ3jZNn7/xh0p/gxXSxZeIDFcP0jCSEOc33
         qACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637221; x=1794242021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZDM7pjFprraJZ4e9RLnqLxhxQi43j49i/Xcsi5OwC4=;
        b=p6Mmuqe/qGbHWq9GwjA+1lanJomtEEaTnzxLQPbeelRIo/SS0mX8xWOkOLgFI1CPg1
         71rdCnstsgT5etTL0RJ/fnWpPGMKu3nMbkZxvUnvclM6vmlY3tiW4X+LVpwsfUsJ5n25
         UsRxuAw4HqOCX8U8yMIri0r6rWMJoxG9xKLAydjzM2MSGzvK43iOsGLRdkUsscJ2RkZz
         qDgDp6ORpq3w2RpiPW53fftz2KaGmtcjmAsXXGStpCN5u9QEOrT53jf2vGGNaT8eMIG3
         uvmfcPfAeXCJTWi7kShEspNIxcPOvdX6QLYAvZ5JTD2okEa+MAR3wThEpCFZ6qxthDbQ
         s84Q==
X-Forwarded-Encrypted: i=1; AKwUvByLt1G276T6yd6HEBq2mHCXPBULeaVO50iofAGfj9i6OJLIe7ty+8+kv7qyWUg9dIFszdD3s8Yf/TlgUhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6wPd3lFfiOV/Vvembn2jLCaooftuZXYOr/Fx2CWjPMp1SmdUw
	Pv2AA02JNRiZ8CQtRV8Gu2BHIWzd9fgYewvW6gX+4rm2DAw3gNYo3ZmXS8S95ZWCD97V/En9PnC
	6Gy0xwyouc55/Wb8i2FcsWAVcKS3PyLrpjLe5XLCFbc8s16OjWSd9IwnVzn6yPmg7+Q==
X-Gm-Gg: AYBFou1ChzRVMD2gfIHF4LJLhbptjsfXMfIUmrvkYSH4bMZWJsdyiSninh127mM5iYB
	YTL1pYQyj1HQuwl3kYCQ811S5TNKnYNRCv1tq/sl8duAdTTwLm3b0+nQisl3OmWbSwLt2Ofn0Tj
	JZYDsguGPSJI/A59PdyWD1zvWnav4JBBUgnS17/a/hXbTUHUW5xf5yoxdde0Kp/rHc43+zxD7OO
	ccB/eiz+0ptdxhwQJj06iQhMAHEc/P+78yEaWrKk+97ExXbxdkktKqCQDKkTe85VKNv4lIJDoJD
	jYwCOSKU44m1rk5gpzE8xnoePeGLsYYkBiAF9ATz3PQwZbf+A05ScF9KSfUiVGkfoPbJ0lO/Maj
	IvUeziOInpIluUBaT68cj4X6Md3/eRsVHVo/jie+L0A==
X-Received: by 2002:a05:6000:4311:b0:48e:75a1:1e38 with SMTP id ffacd0b85a97d-48e75a11e48mr17141432f8f.56.1793637220639;
        Mon, 02 Nov 2026 08:33:40 -0800 (PST)
X-Received: by 2002:a05:6000:4311:b0:48e:75a1:1e38 with SMTP id ffacd0b85a97d-48e75a11e48mr17141372f8f.56.1793637220112;
        Mon, 02 Nov 2026 08:33:40 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20861861f8f.38.2026.11.02.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:33:39 -0800 (PST)
Date: Mon, 2 Nov 2026 11:33:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] virtio-mem: only mark the device ready in kdump mode
 with vmcore support
Message-ID: <20261102113328-mutt-send-email-mst@kernel.org>
References: <20261016023521.747447-1-oss.patchbox@gmail.com>
 <25a35fa8-9540-4892-8375-1788e6795dfb@kernel.org>
 <CAGG=RgDUFpDqtbws4YO4T8A3pS4Dr9twVqP9hSD3J_zP5Dc_mQ@mail.gmail.com>
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
Content-Disposition: inline
In-Reply-To: <CAGG=RgDUFpDqtbws4YO4T8A3pS4Dr9twVqP9hSD3J_zP5Dc_mQ@mail.gmail.com>

On Mon, Oct 19, 2026 at 07:46:50PM -0400, Yuho Choi wrote:
> On Mon, 19 Oct 2026 at 09:05, David Hildenbrand (Arm) <david@kernel.org> wrote:
> >
> > Which kdump kernel exists that does not enable CONFIG_PROC_VMCORE?
> >
> > IOW, why should this be stable material?
> 
> I tagged it because a9403425b3cf has been in releases since v6.14 and
> PROC_VMCORE can still be turned off with CRASH_DUMP enabled, so the
> -EBUSY path is reachable in a valid configuration. But as no practical
> kdump kernel disables it, I'll drop the Cc: stable in v2.

still did not get v2.

> > LGTM, but I am pretty sure it does not make any difference in practice?
> 
> Right, nothing is queued on that path, so the device has nothing to
> access.

