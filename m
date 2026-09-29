Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769661A38F9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708695; cv=none; b=Qxau9qzlA/prFT2fiHS7QIwich5Y0xcjmgFuofpoJLrC+v8+j0BWOP01H3vsRwKShn/Io7bRazgT6OUGnp/p7QucDZ9oRT5n8HYB+p2mobEBot4NW8yrwdi3BfAby+DQdQ0JFxtAtA5l1bhJJrg9dZNWC1TfnBmwththEzmZ3TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708695; c=relaxed/simple;
	bh=DA0i1UnLIe05CktviLuH+FpaeQx48/dGLwB49X5lpY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTYASMMjbjUFc91425W5DEttoWqeWzFzdjPPbchIQshIvmzh6UynRIMHRfDSvC4uI3Wac5wp2lZckMl6Yja+tXc++0YrlJWlGSrMPWPXPg2Q66dHvR5j7qzFG9doo2At9yDhm9K67oHpOXnP+h8ROAc67v4B71Pgk6bZyHps9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jeKYtVS4; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jeKYtVS4"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5d67aa05so401399585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790708692; x=1791313492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SA4mXTUSdd/EzJdx8NSbO7NRihun4BRn1gT/3r8Zi8=;
        b=jeKYtVS4wxPJMpmUNNhMmbVwYZryfSegOtJHjXD5BWIbZeKBodbV6YGXUFvWolg6Dl
         RauFwzVsS8L1qn28c5AszlF0/jlNU5R6XpuGmtw8e6LOio4DyziNt/T78v28CKq1k5sV
         w06VhBG3fsAraXq3ys3hWXDYtMLsXz0U5q9hXAf4lu2S3tB/8EhlaBgINU62XySXyNkU
         f4/FrgF6RwQEnGLPT9/m3e8DIgjU4j9RrmWSCYSmo11tFFKx8/wWDsZ3muT30luEgA9L
         +nQv4Ul96pP7xEfXNBy+htti8SD9kC1SCkdLvIy807G98ndohVAVRYUAq16pPZcAcG6D
         2vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790708692; x=1791313492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SA4mXTUSdd/EzJdx8NSbO7NRihun4BRn1gT/3r8Zi8=;
        b=aHd/fUyl+3gfJh1CeZQ25nheHJFDU4xLT1FmiVdr08Z1qiMknbnOgcc0RdRf1sVbn6
         FUyc+aGGFGBC1wv3OKw2GC7ydVOW8QN5TUi2t6hm+Qi2xuK7gOeNR8oLMnGksUUOoQYz
         Oy1afZdnq48iLmeYXNM9CJklMOOELdk7PGEyn9v8N2+cDIn3jocuyrryPS9fMnCde2Ie
         9poDABJdVado+u/O+FQ8ii9TWHWn2kWecZ88JlYdxLlk9ejzTe0FUnZEaLMLdJ5CGYMe
         aVit+X32aXbvDF0WB9gvFTbUXWcdDgQ8Gr/87B5x+PVFWJ+FDTag1KYtK6bpTFrgJbk/
         U0yg==
X-Forwarded-Encrypted: i=1; AKwUvBxe3mNKBG3H5FNV5ZZ8jNf2C7BgGRr4DWMsc3/BVmBjkmfByf7AUBINF4bDKSDTXekj/eyYxb3wTu6+qNY=@vger.kernel.org
X-Gm-Message-State: AFuF++l0gDh/lkb4AkDXRk/il+7FPYdx5ZqcUwHGMds5sbtlb6ihLAm/
	D5rLm+ot2GPUzeDYhcLuQm5ATwuQUjRc5ToSRuvzct9hLIXHIzV0ihZMU9ya7XOyyws=
X-Gm-Gg: AYBFou2VDGjRHNxUj0uX2xMOVmKTLL26WLCU1WFif+fiar+SusGfInAVaSueyX+NXNE
	pMz8Kpo8ZO0vwBX2AZyCPpe7lc0n/Mv2YRdxlk0KY7NcOVV4mfxwIRXfvOEstMLMtvFQYhmUprg
	0g3w6yyw2E+zfY0ot4kRLF2eCPFtrND4kc/CyZHDCinu/2hRfOYxaVYR0yG66bRyEiIYc6IYm4q
	BKZpXbbCjVn695EMJodTx3mbvVtsHfbjZOCx5kMXGBVDRVunC6gPYXJvU2tKFbtOYWw9uFvGEFj
	Ydnjkda8Yni9M2eqhPpKaWrO1ihx0nlbntmzKkn79OqgkOvzJfiGW2PzoA6Xa+qGGzUh+fVek2x
	djPhUxeKk/+j3X17k++isrJZlM/fF9vGjJZiyNZb3YtqamO+uLmwijO6Bt375mdRbf0kzItrqFr
	uGid1OCsJaD5K9fsEgYwjcmWl61iYYBF1DCJtmEKScZp/8
X-Received: by 2002:a05:620a:1720:b0:93b:d7a1:ba0a with SMTP id af79cd13be357-93c9fa5845cmr105191285a.53.1790708692139;
        Tue, 29 Sep 2026 12:04:52 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f503be9sm38271785a.31.2026.09.29.12.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:04:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBd8E-00000009pP9-1hGq;
	Tue, 29 Sep 2026 16:04:50 -0300
Date: Tue, 29 Sep 2026 16:04:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@nvidia.com>
Cc: Sami Mujawar <Sami.Mujawar@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Dan Williams <djbw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	Steven Price <Steven.Price@arm.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"cedric.xing@intel.com" <cedric.xing@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <20260929190450.GM163130@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
 <20260422124041.GJ3611611@ziepe.ca>
 <arvh6uGzue9yat9n@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arvh6uGzue9yat9n@e129823.arm.com>

On Tue, Sep 29, 2026 at 05:06:02PM +0100, Yeoreum Yun wrote:
> Hi Jason,
> 
> > On Wed, Apr 22, 2026 at 08:57:00AM +0000, Sami Mujawar wrote:
> > 
> > > > So this is tying it to the same FW event log that TPM uses.
> > > > 
> > > > I think that strengthens my point this should all be uninform. TPM
> > > > drivers are directly exposing the event log today, but I guess that
> > > > needs generalization if non-TPM drivers are going to present it as
> > > > well.
> > > > 
> > > > How do you imagine getting and manipulating the EFI event log to use
> > > > with this?
> > >
> > > The event logs from UEFI will be handed off to the OS using CCEL
> > > ACPI table. The CCEL table spec update can be seen at
> > > https://github.com/tianocore/edk2/issues/11384
> > 
> > I ment from linux userspace. event log is well establihsed in the aCPI
> > side for TPM and in Linux today it is only exposed to userspace
> > through TPM.
> > 
> > This is not TPM, so how do you intend to give the event log to
> > userspace?
> 
> The event log would be exported via /sys/firmware/acpi/tables/data/CCEL
> with binary format just as TPM event log is also exported with binary
> format via binary_bios_measurements.
> 
> Instead of Sami, I'll post v2 which rebased on for-next/smccc-bus in
> arm64 tree.

Okay, Jiri is close to posting the "attestation subsystem" which this
needs to plug into instead of creating a bunch more sysfs files.

The CCEL log needs to come out through that interface.

Thanks,
Jason
