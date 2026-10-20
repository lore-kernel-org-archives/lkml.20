Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504211;
	b=EDIERu3MoafuhPhNF4SyDMz6Bwz4MiMtKiUckRSkCOmVUPGAAEhkuF7CviW8Y4EfRzmr
	 wmPwpzVj0TFwxcpfGpGeEqThbON2G/T444+yHzYnIwyHtp1ZVTZJW9UiXktfVu+iLKe9r
	 cG6ZeijlDlMAWNghupXXaGE08j9g44IkG7l3mvGISCrJ9BDtzdvbcHWg5XTTpSgPNENxV
	 BnhMvWrVYF7/MPGc2AUESpHE+1IUoPl0GoUvIXBUBFN8pwz1XGnur6xijN1ta1ZhSUc9/
	 Q1PDVuliNNeQBvwOiHAgMYqCQgKUAOAmKyYoYTEA2D23mPCRlGiJsER9vxstzq2LtJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=L4U5UYLlAya7jsMhIje74k036UH7Y9HqJ+sW7JwcvH0=;
	b=kJXKdAlXyFvSs0Y0/84T71dpXqBBi7XZkz2BGMfq7IKlOv44aottJPdOXqs0JOMQwjdO
	 JJjIZ2+XqjppSBKU+W1NnInNjq+S6mZtlzq8ksEn0RhlSJ8gm7zgvkHTROxm9zU859CVn
	 DFhS/WYYSZ2kdlkUdrP2SyMhrnOq8c/GKMc2jrBUWQD2v2YHayRy60w4AxJZ1kw78Bwo7
	 tkldpkl4HtKb8FAQ0Cp5bIabc7pqT5eG9MvPEneY/RbDKzQ9GzBWxJWuIhTrYwdH61Hk4
	 gfknvBoVtK6skoRrNgq4m6J+V35KqSVKKPuoXJ3Jmk02acTWr6aqJV4dG9Mjk6wjPWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=L39EG48g;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0A3606AB11
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F0A3606AB11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=L39EG48g
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f36c18b75so179801785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792504209; x=1793109009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4U5UYLlAya7jsMhIje74k036UH7Y9HqJ+sW7JwcvH0=;
        b=L39EG48g+a4TXKfB3mpuDYsTACW6dH7XIlJQ6b9JYZejVYM5hKWl9PazjJbxtyK5Qz
         xgJ6dF4dndSY6JHzyPW6IDH8I8j/g7qgyuqW65aAGxxITQJ2cXhV5WGo4HYQAxco7DKi
         huCWF4QK4LXR9nInipic/v4yDfAJnuzqlw9joKGIYr6szA2sxdkaoA+zN18cZja9fv2I
         sdyd4IXYweY73MvFvDrx7WErq0ht2Rj2ANYHLcF8mHvhWfjyfx7JLUWuX9thw8C2wemf
         zBO5bqy0ND9uVCK/orpl1Legpe+XYyLBDtO4c43nVxeG688WlqXP0/2bkhTaXldEI2op
         SIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504209; x=1793109009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4U5UYLlAya7jsMhIje74k036UH7Y9HqJ+sW7JwcvH0=;
        b=sAg2YpDxf2uEjsD0+DNvBCIxh117cUC1AcLPMPZkTIC/lapjNd/TE7Gbi8iMt+RTBg
         CbW3zv8J7Vl7eV7251MjG0mzG6uZ+Uunku8mIfm3cmcA2MzzGYgpSRRiG0UZXAMoKVGO
         uxHwoJEVPRtUWBrtGOOU1GYqLBSw+QkXYzWcG/5NZLKTv2d9nkXnnslVs992tNrDM28a
         EXb4bHVjzwpbIDdkj4wdG2GPuXvnVCxnjL/rY0wf0PS3rzoaBjEXue0gQM+BbJzd6rg+
         bB8gbVAbHVOYp53+yVxQqo1BRlEwOzY8zD34H5QUMABgenBQRuqkRmLDmmO9Ox98lyCv
         YYYw==
X-Gm-Message-State: AFq9FYKdWkxoImY8VPCEZEdZPoztx/vRzrbHSe/zfaiA9vYLVmYygU4f
	lWbupULSk6mt7oBcnhVcY0nmPa3zL16jcI1YxrElKdJvbiyNe6B3xOJL4IRvnrQnMEw=
X-Gm-Gg: AYBFou0G/Y+ujSFTV+8KaGvJKiS9GdQHQ2HULbNclyb5dP38c/cgYqPBXHFK5W7td58
	b+EUVVQ3TIU7OOAW0DVe6tU5ciAuNGkKPmzU0Jtgd3hD2tp2r41Yd3TQHTha7UzlZOzcrXbaSWV
	gOxAdUpb9VsnhW063ojOfo8lOJXogdDwVnj694FjHGafz2+KKgCbf3yh7P9HLdlb/mvj01nL0GN
	zGVqsgdCt5P7YtVD4R+z0SdAPDegfZZcM8R0QmZWmB8gm0i/WG2A9uLFgGkEkhU7q4TJHtEpqNi
	7XXC1K/pY4wVOBqek/XRHUWmhBJ6iYm12ebt5YXRBVjBEJAxgabiemqeDCDsr99qbCslq+Em/al
	vmfao6AsHei9uBUwJLwxTmaWUR0GmZrcp0KtWZ7Zbnr6nCebn1/eFG2NgqCRyv8zyXP5idru5oh
	3n+jUwCtmrfpQI+9Jtt0ZD30zAOAAhlKSeAfhUjL0pfaXQQqTE8Rwe3KDXiCFbZBVrqwNQxF/uj
	wUanhOplib8IWDeP9EpvBCLbeiK7ul0TX+wx01Qd0YupurcP8kRg0mV
X-Received: by 2002:a05:620a:4689:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f3646a313mr1474410885a.64.1792504209082;
        Tue, 20 Oct 2026 06:50:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b082ec5sm224944885a.20.2026.10.20.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:50:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJAEA-0000000CabA-1he9;
	Tue, 20 Oct 2026 10:50:06 -0300
Date: Tue, 20 Oct 2026 10:50:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <20261020135006.GO14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
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
In-Reply-To: <atdvnMJuHUJlqX8t@e129823.arm.com>

On Tue, Oct 20, 2026 at 02:41:48PM +0100, Yeoreum Yun wrote:
> > On Tue, Oct 20, 2026 at 08:13:37AM +0100, Yeoreum Yun wrote:
> > 
> > > > Also this is weirdly structured, it should just be one driver under
> > > > drivers/attestation/ that does the measurement register part of firme,
> > > 
> > > JFYI, FIRME's platform attestation token doesn't have the measurement
> > > register. ploatform attestation token will include the firmware
> > > information (e.g. firmware hash) and verifier checks the firmware
> > > information. the meaurement with RIM/REM will be part of Realm token.
> > > FIRME's PAT is for host attestation and doesn't include Realm token.
> > > 
> > > Therefore, in the new UAPI, attestation only have the evidance
> > > interface and MR interface wouldn't be used by making mr_cap as NULL.
> > 
> > I'm aware, and this may change.
> 
> Yeap. but current, it's enough with evidance.
> 
> > 
> > > > it shouldn't have two components and some weird firme_get_instance()
> > > > thing to link them together. That isn't how to build HW drivers in
> > > > Linux..
> > > > 
> > > > Since ARM has bundled different concepts together into one SMCC FID
> > > > range, it probably make sense for the smccc_devices to somehow spawn
> > > > multiple smccc_devices for the various internal software aspects
> > > > rather than have one driver spawn aux devices to split it ..
> > > 
> > > If FIRME were intended solely for attestation, I think your suggestion
> > > would make sense.
> > 
> > The FID are largely orthogonal, AFAICT there is no shared
> > infrastructure between the various functional blocks.
> > 
> > SO it needs to be split into proper narrow drives in the eventual
> > kernel implementation. token goes to attestation, link ide goes to
> > tsm, and so on.
> > 
> > > However, considering that FIRME may be extended to support other services,
> > > such as IKE key management, I think having FIRME-related code scattered
> > > across different subsystems would actually make things more complicated.
> > 
> > Nope, it is the right thing to do from a kernel perspective. We always
> > de-agregate these kinds of multi-function devices into proper
> > per-subsystem driver.s
> >  
> > > I initially considered introducing a dedicated FIRME bus as well,
> > > but I felt that would be overengineering.
> > 
> > Nope, just use the smccc bus and split up the 'multi-function FID'
> > there. It doesn't need to be over complicated.
> 
> Then, I think the arm_firme layer could simply wrap smccc_driver and
> smccc_device, with an extensible base interface shared across services.

I wouldn't over complicated it. We already have smccc bus to do this,
we don't need layered stacks of busses here. Just change smccc bus to
be able to break up the multi-function SMC into several devices.

> Would it be better to post based on Jiri's branch [0] for next-spin?
> 
> Thanks for your comments! :)
> 
> Link: [0] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_pre_rfc_draft1

Lets give it a few weeks?

I'm confident both of your attestation drivers will go ahead at the
fastest possible speed once we get the subsystem settled :)

Jason
