Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266215;
	b=Rls6a8IGHLbMr+GkPgivtfsn0CPWPd3B8X0icXx3UyQFBFqj6GBwbf5UXbGeAjyVqEhX
	 eOS5/drvot51+uOVX+LwIBhxmG8hJhPDLqKd9XtsexgKfefOrsm+FRJNwFAUrfhC7+IQI
	 Crext72S5tPXdX9ui/7mPr3KCzu/0jB5EkBZ77uOqhTXh1AWTSd8Xeyfa/TIFQluGB6yW
	 rru6Gw8UJEHgFj9MAMzyxQl2zgVclmCmpVZdzSL6IZPg4GeaiJt7uvVKa6GOClAOO8xLP
	 rRc15YruIRX9qvvzh7sPSlLkDuhf6z/KniQOBJtKY70Q5/StyA31zOzZcFD92MiMQ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
	b=1GXuVKfq3hZ7r8jFqipR4pAqOjy17j+dt+sqJYCmlFY9y1R7PiBBR7vEAcwe+naB3LBk
	 /sb/JsgWZzL4aaFTWQiFc4xPnC3CPtbk8NYff7DRNue6hEthvr3i3UT6rOdH15SBYCCfh
	 ShPOAlS2Xlf/NafJABWllmfGA0PMEbtfn4AnTQRfW3DcUWTJYLLOuIYB+lKbmQuVJoizt
	 vC7czCO2KeHpiT35LTWqvQc7BQev98oag8FyvnyN9v891nbVpsbGEmAfOq8FVvyX553pS
	 ypjEKAlIlGl+PhVRrhPtE3SuisSYXSEykgl2s1+Vqi38QFfYRivqiauwcETQgXJKBFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC19606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC19606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1667819f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793266207; x=1793871007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
        b=quH9pYLZIETR04d3yKmQFTy1ZqTKb6PP40cYO4TwGO4bHDxZVFg1XfSuuw/cJ+9GOV
         6s0JSiO6XSVuxhaXSYJyGQIp1h/4Q2EbGvVtF7mFxGpuOMG4BCW/+ShuvuVMiCB23+Sv
         Bl3oHpiRalOlsDzuoXZwV8CH9JdaDYkiilX7JIPQYGtVqepwEXJiuQHPEC10+3c2p3Pt
         hnDIzFK9kttO9BFinkggUOPnm+39Nv0Vz7t4fEXEWCHfecizU7Za/hbrKdJFrkwS52jI
         p8NYQGUFduovAJ02P+qtE0BTvnmGgcxknifYKHNwpMuifDLSTHBCMuINlRMDvR6DAakd
         KZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266207; x=1793871007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
        b=P49HHov8GnbMDTe8vQCYx3jOqMUTIH/8ptwEvd6kzyzNpeDPDtlXtYTJAvXqvtuKTi
         dTWYcUZw1gL0ype8ZbB8bAwSE/glygO9+I714SV9jV13aKkgVkHpqMwxbvvNWSQntxvX
         PNhaxNat9wVjrzqyGw9qA7PnKWVWHQkjXshD5INITd7prMGzVq1WM9TvhajH+V0yY6Nl
         Qq/JN0hByLI2juZdbHuzY4OsQTM4sRJQc4mwOKQSM3qPbg0huosaNTdrUSRUH9HqLUzp
         +EoxscKkGWmkyzRfJ77dOgUOs1Rd0G03OE9nDy8f12wjT6XfHAhm6fJr2syD3Rbz7wBz
         1cBg==
X-Forwarded-Encrypted: i=1; AKwUvBz3vJFGPSitjWrMwD7X4LDAkzRognpVQSUSzmefOCU1mQzU22kNfedptWZx/2lwgrxllf6ixc80Yuy40Ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVhLtno7a2hxdUr+jY0+HbrgiRbt6AdnbblP0+I7p4evMw+yOj
	pAOa6oQd6wFoIJS4/M2lDiRy7mXf7uATknZgNNPnUhv3n+HcY0AoFVyUAtgPRoWOAhA=
X-Gm-Gg: AYBFou1AEirZPaxaSv8q4kJAy1NsB4CqZtMPKiWTRY8n2fYNQkKd7yajAtL14RyWSUN
	gEYwvK/DtheBfp1BogP4Aqone3DpBQjbAz3mVXnhQTg+uee35nQBWq1MXDlNARD2Q2WBfauPklB
	7WfwNxsm3TFArVvC2tHTGFJXW9Oay85HzVArY1L2p0mYkBMR/ChvuCWTbx4Su12GlNP0Y7+OUeq
	hpyTyZVMBfxbsxhfFMcQrrpK11G+OkyDV90yTeYaXd9xxkiTKwZxYCOKGDLNDkwYponjDh7xXNp
	mgVIPp/Z1kKG/uxEmf00e3cLKn7aRWiQ0H+l8QUYBoxLYWEPue4ERYrClhVijOLfHn2NNGCKKbD
	xl/pZVVa8MqXO0Y/y2GOpZ4qGlDh/Narzqk+Jm0MtmSONWeilXKZK7ipAbnb4GYcu+BbOmfZhRP
	1MSW7hyHgbRy/i0d3eJjI7XvlFToVEZGDlG16gcFGG4N4Qe5mqKXBoGYSivqy6XvYR7XQiQz8rK
	JsSfVROyXZPuIeSUG5qqxz2JcczEDorE/8x1utWi87zimlTV0I3dV+FZD3ciHEjL4HX5YMLdDp3
	kK4kbv0FBe7MFXeWj3nFw+chgK2FylCm2sYESg==
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a966c41007mr110102485e9.15.1793266206771;
        Thu, 29 Oct 2026 02:30:06 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40285265f8f.44.2026.10.29.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:30:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:30:01 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <auMR_GztmsRcEHpv@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
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
In-Reply-To: <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>

Wed, Oct 28, 2026 at 12:09:19AM +0100, dave.jiang@intel.com wrote:
>
>
>On 10/27/26 12:36 PM, Jason Gunthorpe wrote:
>> On Tue, Oct 27, 2026 at 11:43:04AM -0700, Dave Jiang wrote:
>> 

[..]

>
>>  
>>> 6. tdx_attestation_test's discovery_and_construction_fields expects an
>>>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
>>>    directly, which gives 3. In a real TDX guest it fails with
>>>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
>> 
>> I would have naively guessed this should inherent from some SPDM family?
>
>The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
>no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
>directly, so I think the test's 4 is what's stale. Jiri would know for sure.

Yeah, looks like the test is stale indeed.

>
>DJ
