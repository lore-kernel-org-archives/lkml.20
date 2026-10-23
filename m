Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782058;
	b=X9YUcj2Gk6Ot6bbVpZmG4OBCrEsb68lFnLWPt1+CRDjUUMTnJqMcXd7mTPvh9zLmEEc3
	 W3aM/GECXem8osuYt5VruKR2PFdQqO5sE6BGVWWpf0gOCcpMtryWwwx2VjzdV14d0Ys8H
	 d8JbN0YJDyxSw6NuTUwzlzxYf9vGuFpv+hUILfGVlcVtz59hdDRAtk56dpRF0R2Qdmzn5
	 9zkATeWKHogct+MW+ba/qMwYz+ZTVGg8VsosrMl5z/3sQrrcVYhMerhTlOYTv2iSHhE+U
	 JOcFdGqNNEzFrukPJQ5nJmTI2qOI0TZeM3SCuuRIhf3aITDlK4y3PU4qgPEqKCAJKsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
	b=wFRpl+VsCfUEcjnLU5+VIE2flNNpUcpi+vANw8SA4oroZbd0SdiSR6tKMZjHpGnO9zqo
	 D02p7uirply5+fmOtDLbuk1KBSRHkEgkpF6bgW4Qw3949QqHZ5ifV9EDto4GqErd/bz10
	 RfUYt3TQRnTRGrenw6hCjuKkwb4MLnAiOfaEWg+uOwt4NEl/ZYScTWC4sUgapHAiKLIgn
	 HnWl1YXOhRu4rubJx4Vc0WcnrQxbklMqu+N0Y2C/V4oN+fxVC/Ao2dgmqUR9GJaR5r82f
	 wPOBldWsvM9C7L0nRL1KEkeug8YDlHdzOIBg+fdH3tE+Ic7wsvHlIlc5vc/YTKpHBdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bzc4Cg9j;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F35606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F35606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bzc4Cg9j
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53397554beaso12640381cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792782039; x=1793386839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
        b=bzc4Cg9jHc+EwZ+EF2GHA00SaE7XNzyRJ2jPm8VaHgqzKDLrehIHY+5e8wqB1yH17y
         sndSYk22aMmceP9P1fMLTu0Z4V8EzlM2RGsFmTw4gK3j741dLn2NCvrwBRx9Zs2Y9Nrl
         IH1Flz0MwkfAlUgvicHD3GXb1HCVFF/PCxVAEn/OVSguv9eR9Zs++ljRZWXpHTqI+xAr
         rfcFCA7qmIwN9IxX9GeYG2HRZ3YRwMSM0MH1BmgGZbTGcamONR+rAGI29PTmp5avInXD
         sAUAnL9pEXhpYTml9nJyCuJ6EjWQTeYXwbhCn5SvYnMgGcHEU9aguEL9UamXbiSuNSk7
         hQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782039; x=1793386839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
        b=CJL2GBhcTMgHFrR5FbeNAPCN+qPeMH6RRzaR3PwB9qxQAlm/jxFxavS+mlnOgMaIg7
         +tNtCZ3j+FADwdGtsyhpH2iNHTckpzk6swe8erTR26t0Kt0DdpNjVB6zF2zm66v9Redw
         eaoOIQ+m+aNsXGfhuwtxUh7ILai7Mr8Jl76vk6VyavmGc7jllxzyxmu4NRhj3aOWLI3g
         kSUwZM08MtxpBW60njMOm1nBYrTulMBoZPipPOm3P38dNfpkiFYSNxtGXzas8IdZUNOG
         bWngo4yv3yGWAiD+5ZjvcknBXH2q9sn9pfxU/3ENFYA3yOKfvPNeukZWozw5J10HyyGt
         LNPQ==
X-Forwarded-Encrypted: i=1; AKwUvBywBkF/QUqSbqu5+bWjS3QL/ITg98a0Tj+DW48RaVpuoChIDfAhyIk8Rj6TqTHrZ2JsnTx79zNSFjVxkLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWeKUm6hT9lKNE6X6Z63VVzPx/KfY4Vw7ViSN1RK9RpjXOtSgT
	ycPQQllI0yBCyIpeGorB5XkQT0YWQD1Pu1ckyYrS01tPsCLX8jyo6httggKgQt1Stpg=
X-Gm-Gg: AYBFou0pdG0meZpGmplQs9t4ssebSME5A51Ku03MgBqzYEERqpK1CQyBrIZEZfmkPSu
	KmTc7cAmKDlEKA6tbnNiyEMyKDbkJ28peY0SiX20jUvFYdZvyuXuH67u9t3AgTatbcOQvDRdOvg
	If1/aXhbaGqvPhpTSaokGB4pMGHPdP2nS+pOdTK7GvW2tbCh/WXPQZfsY/j4P+LxQA/6mxGqf43
	U/fpL3C/8UiBd+SNKk14eSLlryR6j4biEzA8zE1b+MSOk9F5hEIO7Bi6rh+nXwIAPaCe7Q0oYdM
	VFNw7792cTEe9fom0rsJMIJks8ltGDspoDxQ0xaRRE+Hj9F2V7a+w03s/SFn/8mWKpICZQQ9va+
	HXlQrHROIAmp14unMj9EfwAEj93X0aPTVtJPaeFQAm5bN3xczgsW+OMPShkmIcP44WU2ME7vQ7D
	4BX067G6VDFl6q2vW0VrIbzaQvpEtgpDc1SYKPWqT8mFr7enEtrANrpT4rL3/Seex6uCbWMls9a
	RDDbIAigM4Zo7R0hagEgwfwnBUAMGtuMXAh/SDs9og2qNSZtCUCCT1RLwcuWC21BRqcEiyn9Te5
	3K7VfqWxv/5LDUatM8xNSl3UrCM6yq5TP6yYkg==
X-Received: by 2002:ac8:5d8e:0:b0:535:a5f9:7520 with SMTP id d75a77b69052e-536c26e2168mr47897061cf.63.1792782038589;
        Fri, 23 Oct 2026 12:00:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53839709ed6sm1185741cf.16.2026.10.23.12.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:00:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKKVI-0000000GxzN-4BG5;
	Fri, 23 Oct 2026 16:00:36 -0300
Date: Fri, 23 Oct 2026 16:00:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v9 02/18] PCI/P2PDMA: Derive routing from directional ACS
 controls
Message-ID: <20261023190036.GL3977851@ziepe.ca>
References: <20261023155914.GK3977851@ziepe.ca>
 <20261023182715.GA2798722@bhelgaas>
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
In-Reply-To: <20261023182715.GA2798722@bhelgaas>

On Fri, Oct 23, 2026 at 01:27:15PM -0500, Bjorn Helgaas wrote:

> > Yes, the ACS combination is selected to avoid ordering issues
> 
> Does a user have any way to know whether the configuration is safe?

No, unfortunately in PCIe so much is really difficult when it comes to
deployment :(

> I'm wondering whether users might use "pci=config_acs=" to configure
> ACS so things appear to work as they prefer but may not provide the
> ordering guarantees drivers depend on.

I imagine that could happen, but on most practical systems the root
complex will blow up if you do asymmetric routing so there is an early
indication.

I know this because I've help debug such configurations at
customers. Some servers helpfully MCE if you do this. Lovely.

> If that's a possibility, do we have any notes in dmesg that we are
> depending on fabric behavior that the OS can't discover and verify?

Maybe, it could be interesting if the P2P logic found asymetric paths
it refuses to permit it.

Jason
