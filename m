Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457339FCCD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711106; cv=none; b=HidC2pf/x73RL3mYCr+yaTn31xFsfK8j/GWRtijp4AzBd899g+/3dg11u3eloXt0BUvEPKiyGl3kFL4HWjIQhE8b3NJdrW/Q5Xc6dFec79xwP61hKv3GyxezpY07KP5ntO5RGHGtSJ6dyPDd9R4Vvb5sSZlBShsKZoI10pYTiow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711106; c=relaxed/simple;
	bh=Hc9+tOV+hDEfeuhBUGb/ETv1PIT5Ms8XVmHiOIPGTP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF71TCTIo2vIeODtZdYZvl6b7IH6Wy1Rp8fjSxl4lW+chFbGRzhv1obZ+Xv0TgX+0X4DFh5FHeXALyD7x1Ro+17nNiK+hJ5hz7PJUtjp6EBV/kJzUkbzNfJlZYRnDUSMjV5AfEYvN3lN7Q6P34ZupLU6PZvx1VVAS5lHKWPZeD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jxltc51h; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jxltc51h"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7006038eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790711104; x=1791315904; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlqSekmBIvaPzDfuozpOnY+MYgiQ1xGecmLC2it8BD0=;
        b=jxltc51hH8hgn+aK23o2RgW6TN6QNON5fzNIPzWpvS2zl5glK+4lnVILgc5+cAxlKO
         lQ5LiRLHbKtN+sceiDxjTr9zJaCeZi8qUyO6qLWCWAk5nrl6ZtXdXQcru/hd832kTHp1
         oVvet8qXMLdQY549cRwdniNShIZep/GSnB7NmEUhTYQB1hPijczv4ExgXmLXbE9aUMEo
         qnDaeMElqJqNcG+bpAh4LYgi9OYNdxeEfiUhUyNHRtfFS+4scY8mK2QHrqu06fJGeNyg
         EEiJJAAAPk5qn4B/oUmcc35ZhhjvGjxrraSGslL5AShk4PtosRZbfXv8L4qwecXAp91m
         egEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790711104; x=1791315904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dlqSekmBIvaPzDfuozpOnY+MYgiQ1xGecmLC2it8BD0=;
        b=tB4o/MxV928AzqACOTji6iTm4YhvB0YknLNuCn0SWoKbSzfsfmyA5ycAdJ5T+Hqk9p
         6rA2r7k0DSLYRfLU++K5Rs1XH18mZ0FJeSIK+lAujq7L92o4e4gY5fyXwG0boWZSWAo2
         x3buSVb9aiamksf8sV/icNEHFd65A41cuFCAOC8KRTcgCzY4B6+jQSGq5siza0g3Su9F
         2V4e5MU+M6Hx9tPbgXNK2yBgzQ4pSbu9prurelXcMJ19TUDuhc9k6IL6d7qQixp9S0lJ
         NEz6afc/2xq2H0/+RtH3cb8fSCoJLBbZKB4qmdRI/WUxhOTBVPBjYC4KPBy33zziqxDU
         Apfg==
X-Forwarded-Encrypted: i=1; AKwUvByPqprub7gfhrdCzhyK0C/4qx+BhUXk1tqIgV4/CN0qEuJCO7/NbHWlK0AcXQzrmk4/UPMBweN269kjyCM=@vger.kernel.org
X-Gm-Message-State: AFuF++liBYPMevPYupIEf0nWf5gxmMytp7lFBBmtDZBkY/OYWyUmI8nh
	mCCIijLoo2n2+/ryIe/A9qkhgOFEYnxAOn6WrS28guEmEVGmARuCVn+aZBmkv7V6zjk=
X-Gm-Gg: AYBFou0z7zL606ZbOuRaz8wlKg79LMPXBs3kAbmOMNEhmY7Yp7J+Ms4ujFrn4JgnaOt
	9y/2I+kofB8bZ/FdIdHHF8WcMAz8rRqiDwqD4kCWxJm7zCvaqs8+DoXqHrhcCI6P1GDZLdx/JDQ
	u6sXb5N2V8/LkOz6N0z3RwBpsN9ER0K80/3oicSXMZs0ZHlPi9v0RHKzwgYvnB73HJJXUhpJjuG
	BicLVAB4ZrCFHk5twenfJie2Pw0wBQt5/yYoGCABr5sXb0MqQI32rkiexDecl2nvdyn+BT5sd+v
	x0mCEE6q+XAR3cHWv8Vzz4/9hnL2Ozi8u5ZERYUr/peA6YPYseWfIRE24MidbMc0IyWPYhyh8vX
	AmLnhWSBs+S6r8kHnHCwS+by/6maUkMT1cYE1yTvtvQdFy6UQgAJM9CGa9G+rW521n5kW6pjzsG
	5BNPxigiAwV90bjsBBOalNr5ax1sn0X+o1h8ln49txLh3s
X-Received: by 2002:a05:7022:7f1b:b0:13b:2f26:6881 with SMTP id a92af1059eb24-14c9c46fbf0mr312799c88.4.1790711104075;
        Tue, 29 Sep 2026 12:45:04 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c63acab5esm1202011c88.10.2026.09.29.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:45:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBdl7-00000009uUb-3ljP;
	Tue, 29 Sep 2026 16:45:01 -0300
Date: Tue, 29 Sep 2026 16:45:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v2 0/3] arm64/virt: Add Arm CCA measurement register
 support
Message-ID: <20260929194501.GO163130@ziepe.ca>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929192051.GN163130@ziepe.ca>
 <arwUrOYn0NVySdzm@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arwUrOYn0NVySdzm@e129823.arm.com>

On Tue, Sep 29, 2026 at 08:42:36PM +0100, Yeoreum Yun wrote:
> On Tue, Sep 29, 2026 at 04:20:51PM -0300, Jason Gunthorpe wrote:
> > On Tue, Sep 29, 2026 at 05:57:46PM +0100, Yeoreum Yun wrote:
> > > This series adds support for Arm Confidential Compute Architecture (CCA)
> > > measurement registers in the Linux kernel, enabling guest Realms to
> > > access, extend, and expose measurement values for attestation and runtime
> > > integrity tracking.
> > 
> > I'd prefer not to add any more tsm_measurements users until we bottom
> > out on the attestation subsystem.. Mainly because it establishes uAPI
> > that doesn't really do everything people need from this stuff..
> 
> Tend to agree. However, I think this seems like an integration with
> the attestation subsystem.
> IOW, although the functionality and interface are currently scattered,
> the functionality of the TSM MR doesn't change —
> showing the current measurement register status and generating
> a token with a challenge. Therefore, even if the subsystem is refactored,
> I don't think this would be a burden for it, and personally,
> I'd like to see this patch series emancipated from almost six months of waiting ;)

Yeah, but it immediately establishes a sysfs uAPI that we don't want
anyone to implement :( That's my main issue..

Jason
