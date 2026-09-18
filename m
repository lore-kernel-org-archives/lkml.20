Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E59A438024
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733497; cv=none; b=OXW+Bk/a1UfRTmLXrdqtmLbg3CXNx/m9TEP+6VDZgpdpAHL0NKgUI1MbU6wIiwoUIdiCjk20Pj9jzahD9N++UnuRfFJDanC1XLeP5zjSBfhNbIqzo37nMmwfZhrf/bDOwC3BYKY7ujZTDamO592gzkHeMsSFjTWm7Zqkh8CMK/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733497; c=relaxed/simple;
	bh=s1lDql1VXnlCt+ybH6i0BOOo/feEGB/hjnRQ3YgjUvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd/2RvB38tlqzGCX62Gw6l+sSQv2zPEYBfreHvae7Sn+Zpxsm4pvcarE/Rc6/YUR/Ztnabp5n/BCP6xv/BMhhoFh5ciQ/NKbPkPPFQi/PrtA0X58u7rA3Qz5Q6s4kJngz7OcpKAjCBRhAQOAA9GuC0jB5E7f/7EuaQReL7HFg04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NLJMYt4P; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NLJMYt4P"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb767cc71so5391951cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789733495; x=1790338295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+QN5KkkjNb5WJjRU9SzJ0Y+OF8nxYNyQV24JJbuLlA=;
        b=NLJMYt4PQee/FT8NPrel3j9yOQSTvruuGIO8VkYHJnAwBgj1DL/zLM5pWG72nNpPwo
         VpoeMAfiC+P3KV2ldZ8hA64Pd4E/eTgHPXjLviNF2QdQyspV11Rho5XrbnclXu8VOlA8
         5LK9qvMj5YIWld3axgaMQbuXkbNlfTJ7l5z25Kzb6iPorjJaqUl89OWJC/mShe9PE0R4
         JNpPSEPtW/ifXV0ANwm9HMcjRswMJLJBFPPbhiqwsjhlbni2i5B5apzlrZuwGO9sYGo3
         wW0As48gv+SNWuP1rO5OlUJJqSbTdYaOTCaAzeg4BDOkSMrfJzbt3kZRDzTVabN/oHCl
         inzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733495; x=1790338295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+QN5KkkjNb5WJjRU9SzJ0Y+OF8nxYNyQV24JJbuLlA=;
        b=rbnGi3jxGBJtk+5s+GJuNbt6h52L/L2llEMIU84gPvl3FwIm/9cC/tIY8BOl/k+t3F
         LLCrpmfBM+MfFfSm+EcrNWIskQBun178t2yutEBGxYYnocNh0ymIl/fZwiPdrB2LOTRi
         GA4p9i15lRWyrdi6SWvf2yYpkVYrZ2IVsLx0D5UbxDy8WslnE9LtQiwvxD6ENaMHTMXw
         lsuBTO7HH4IH4uSoPetckiEaksOSWs7xW85gCy/ovqHdhy5C38LNRFzxuGbsxoPHuTxi
         OiIwK83C6d0ccbKSfFlvscROuG5ex/bMPpLi+PQ9MUhOMEBNW/UAjICD2Ou4El+oIbVl
         jRPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpD+V4x8OGUyFUcZ3DV5SnMz4LRHS2to4a/ghQ6UnNnEFYlJS7uFKBlrULvYHC09AIEX+P2aXj+A5kH98=@vger.kernel.org
X-Gm-Message-State: AFuF++k/MXGEPUNknnUTSpRgOUVe5ze0xEJ4324h79vLDETEpgbSnwLC
	SwaOEYnV0tmWuVW4gYoNYTMSOaDDkC3EqItDPSvw/TCBAvDIRbRttWSrdQfYqkwucvM=
X-Gm-Gg: AYBFou3QZ57JSbH6s+qqdqWKNBDeHV/fTCjqolp9yJthkjHuHrcpkxhMQIBJg4tuXd9
	Pst4PZlZRnT7FmHDgIeVunKLl0IeTDb0u9WaxXKiEzA/qgDaamRh9JQoUXKIdBoXie4MDr+EX43
	0vUVvQ1msZL1MVivI4NlTZr6zRsn0QJD24wOoRR5i0XwZLCehqEC2SI/vkGocZvM6X1BHzQN2o9
	3qR6uMMoK/Cm+1JCxPzo4Gwpkka+U5r/l3GGnUpYYUHBqIf/5sYrSjarWGATb/E22m7Y1+5amBB
	67a0oFpEAusq6p+/sMCKZ11gFkRRr/oGGE0pEcXX0qA6s+9Ona7L0lyPCpbIBHlZrvuECVIviD5
	eo1Ow9GJMt5CviGi4iyJTo+X9OTyCnTDm+x32LX7UcktE6IjDKgNVcrS3VFhjbqllQDpv28eIH0
	yqYH+au+/GLmbaQHgFYmJAw2gBhQO1iNAvlPyKHyBLCDzuFmrWh4sfygrsrduoY3hnMaRHSNe25
	y/+KpqG+BRnX7EpObJOiTHVaWBLSagMAtoie1uNZHh2XomwjEQcW/jF
X-Received: by 2002:ac8:5c95:0:b0:532:9ade:b6e5 with SMTP id d75a77b69052e-5329e58dffdmr33222601cf.78.1789733494642;
        Fri, 18 Sep 2026 05:11:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532a1a27288sm12168121cf.28.2026.09.18.05.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:11:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7XRE-00000001A2N-2VCC;
	Fri, 18 Sep 2026 09:11:32 -0300
Date: Fri, 18 Sep 2026 09:11:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Frank Li <frank.li@nxp.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/4] iommu/arm-smmu-v3: Support shared Stream IDs
Message-ID: <20260918121132.GA11599@ziepe.ca>
References: <20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com>
 <20260916161018.GE3196566@ziepe.ca>
 <aqtDg1EH95RYOdCJ@shlinux89>
 <20260917144804.GI3196566@ziepe.ca>
 <aq0lEk56qRi93geW@shlinux89>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0lEk56qRi93geW@shlinux89>

On Fri, Sep 18, 2026 at 07:48:34PM +0800, Peng Fan wrote:

> However, the DMA channel case was just one example - the shared-SID
> need exists independently of it. Our SoC (i.MX95) has only 64 SIDs
> total, serving MMC, SD, NET, PCI, DMA, NPU, DSP, DISPLAY and more.
> Some of these are genuinely separate platform devices (distinct DT
> nodes, distinct drivers) that share a SID by hardware design because
> the SID space is exhausted.
> 
> That cross-IP case cannot be solved by DT restructuring - the devices
> really are separate. Would you be open to reviewing the shared-SID
> SMMU support (patches 1-4) on that basis, independent of the DMA
> channel question?

I think you should revise your commit message/cover letter to focus on
something that is not a DT abuse and try again 

IIRC Robin said the SID aliasing was a PITA on SMMUv2 so it
really needs to have a strong reason.

Jason
