Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811866;
	b=VJttvaLhApj9g8PxWKETEPZRObqck5FX5KedwaYyM6aFN11QbjpKYD6v4JSsk9LFA0sm
	 2LPeFk5duVOwIBoeXsBssjADAmMNWw2QERtmEFA4wBI7w5EGKavRIWZjNpOqfGigXUy9B
	 G78dZyt6MhGSSqEkdUf2L05QRnRMW+MC30AqpqQpaL+9PN0UMqEXTYFfxlzk2nt384KQN
	 otFHnoDiP24o1iX0nx1Xqdp1S87AXBwdY+VUDd3BTXb3Vl6rOBd27TUyY4Otz5xWkWfoe
	 Lm7u2VY6rHLH04q4Gn86UYyS65BJKVbz0tULvybCdE1GGqmVfgtymrKO3r8snmH/cWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MZ2u1qS+DdTsseNe8GTnRAh8VDL2cIoDDHTiVhBBm9I=;
	b=zC+Ns09Z34mXa6R3UhIrC+YkZKVNI2IK0UY3UQRvFS04mQ7Zm2ujAe9n5gJo7hXbQLTA
	 atQy8er8kZOxxe8dHQG7vpZExQv1yETeDxBcQeXknVwBPw9zvzZPYsmN1w+IFHx91WH7Z
	 G7t3yXtEriZY3inpOPJUEShIfw8AMZ1eik7xJw/i80ZQHRmTodTKT1yD71AghbIrkfZU3
	 Fa5HzWob/I7Qq9XbLYRB5aPS2eKsu0T7T11AYspMYeXUDCwNeE5ehwF+Rz1FjcOwuqNaw
	 BycZ4hiVsYxlcEI1P4M3ogN+bgGvLBmvS4edS6mDgZQCnRWkvjvqin+vQIhgl77DVfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FnPloMwq;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C6A606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C6A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FnPloMwq
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644ab1f7bso7747671cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793811864; x=1794416664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZ2u1qS+DdTsseNe8GTnRAh8VDL2cIoDDHTiVhBBm9I=;
        b=FnPloMwqvWngKH5CC21E5gJVOtx9Q5IEOnDICAe0sUklobcLcaZM+/OzQztOg89V0i
         KuoYr6SyqqP0xsZKBKmoT7XPljGNtu70vol3a74doIKswPmkwzug2tclYHu0Kv6e8+l1
         +JFi5Nq1SAEhSZWtNoYLF/yglFUJwdfBpio1QPbUxTqzxSq0ojCqMir0AcZtuREGNKkc
         xyRB328ONytLaREiGlvambI6t4Rgz3ko2L3z8UmYQdtz5N13n5IxPkmJRjT0jTqvisOv
         Q5yUTN4FFVFuHWw9xNUBcxZAVWN3xoPTIIdN/XDafoot5ZcebTrlkbNL0cBh0geCpS5L
         XNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811864; x=1794416664;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZ2u1qS+DdTsseNe8GTnRAh8VDL2cIoDDHTiVhBBm9I=;
        b=HC/FHn+yzckjaHCAIb5rtGB0HVe381uNMtNzkIQVAL/3qalT0B2WkQ5CeAJUpPzqhh
         n/OhLpDE9D9kzQ3ZpjEAwogSPTwfrkw+BDiUT5ItlpyipMbIoUjzHD9AKIdozl3xntVS
         +J05uzx3ivVGbzDim5dhHY4JzQHKVoARlRn7/8qgkzNBvNUJLXCvm7sJt+55nOksjChA
         2bCU3wwAF36hryJROV5RR3lnqMPPto+DoMYSiSgz+pLaCqAvMfldWujNot05iwSOel3E
         C63mJfzXk2AfO7AK3BIfGXV7u/74k4skpM1uwoAEWe8YAEtmkcl0FrxhxvJloY0TXmhG
         vmHA==
X-Forwarded-Encrypted: i=1; AKwUvBww9gKJvTQVZYJmSiEXVDaVflqkkc9Mzmb+Fl2qmuLm0RJgb69Q4JpNcRSEmy4/vnPYqwt/NNMZXv+UQm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aMSc8DPSVhCV5vGLxAQasNcWRy/je6JHcroo0F5v9X89G4BOA
	69ewwXgtUhdKXQZy6rbl8XSs71347a2x94e93rqXtJVEpuOyuGiWpm+qB5Z0W4ytvQ8=
X-Gm-Gg: AYBFou0YshWmg2sVIfJUNKAk/gMJlJE409PmSpmwGiLt0X6C2wsz71nZlckM0Q4r7zT
	holJWLMbn1wPxVRZXsQAXBvpylXmUMyDahyIJjKt/sV/8dr7hV1q5NJ7DzKEsFZi5FyUvaklcEf
	3akEardB6D+EBZ2Q11vdWJRY3YkuPxY5xiWlZ/Dbj0ue3D1G0jOCZtW3y8bpPudI0Iv+fr/9ljy
	yprJ/zDAY9cbRupSfsFeMrSHNTEMZ5aXDuV3zhhONQcTluwSII21lzE+cYyX5YiH3GxoIFPoINs
	3lLAtKbsWTcr7lYbDmOib7SRinr5ywoLQT5s/jCY7ED8B5giInOE3j70Oiqw6CxfdQsi5LV/Xg5
	KKAzGsN8VWoyG13O+g4y5mgxROL18YQSj9Kp1gyGEzyDD/zh/DHwZjSSGrH1g5lM9C7IGgHE8EE
	ZHtJj0Y9iFE+ntz6y0NG9ii3nUmbTmlu1jQFrbsxOR0RcwHk90DtxY4VqLgDirhgkk3LDXVf9y9
	NyKkmRv7UNUPueFJXH9EkMLxuAnFtJ8VPRypI0vsLsjSa6gidSTnGYRwJ8HVMIZA1Y/JHtNNU4n
	GclOlNigCgdkrq4J4pP9I2Z9/wd8yUTdxhFowFZgZEmBkLiuHRsjohiWaQiPA3WVHooJCcmP52N
	HB020/giJlQ==
X-Received: by 2002:a05:622a:e342:20b0:537:83e9:e46f with SMTP id d75a77b69052e-542b3c732f5mr202335741cf.3.1793811864442;
        Wed, 04 Nov 2026 09:04:24 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10c49ab3sm28279301cf.19.2026.11.04.09.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:04:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOePP-0000000Gg2b-0y2m;
	Wed, 04 Nov 2026 13:04:23 -0400
Date: Wed, 4 Nov 2026 13:04:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Wei Liu <wei.liu@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mukesh Rathor <mukeshrathor@microsoft.com>,
	John Starks <John.Starks@microsoft.com>,
	Souradeep Chakrabarti <schakrabarti@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [RFC PATCH 0/9] iommu/iommufd: Add hypervisor external attach
Message-ID: <20261104170423.GR3889730@ziepe.ca>
References: <20260925190742.1575380-1-jacob.pan@linux.microsoft.com>
 <atiaKG86qcifKzBT@google.com>
 <20261026114917.00005a22@linux.microsoft.com>
 <ausHmkhAegDEyeKV@google.com>
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
In-Reply-To: <ausHmkhAegDEyeKV@google.com>

On Wed, Nov 04, 2026 at 10:23:22AM +0000, Mostafa Saleh wrote:

> > IMHO, I don't see any change needed for the host-side attach between hw
> > nested and collapsed single stage, if guest and host attach are
> > split. I think it is up to pKVM or MSHV to handle guest virtual iommu
> > mapping for both cases.
> 
> Although the hypervisor (pKVM, MSHV) is managing the guest IOMMU in that
> case, I believe the host should be able to decide the guest virtual
> toplology, as that will impact the firmware tables populated from the
> host for example, as in the nested case the guest will see an
> architectural SMMUv3 while in the collapsed case it will see a simple
> HVC based IOMMU.

Yes, this is how RMM/etc are working in CC land.

Untrusted hypervisor defines the vPCI topology, trusted hypervisor
implements it as instructed.

Jason
