Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409668;
	b=MU75tVQnZEJ8FighoN2qn1ha530kguFtNHjO3SREOoxSIqvb0DulLWvMnmopaAKLJne+
	 0obwwDGV2vnQywYa+yxi8yAWINsTLiSY1KPS5F3g7tyG5xNKPg1C+vspLgVnyrMlWDC0s
	 HUpHaTZDupTOBbZkFgJhVnGXIS3jmV7aPbVtIPeYkCWrv1EqVaQ+hxtTB/7T57vH1HZ2k
	 WS4vHCt6kAyTg0hqEYRKsOem3IAAErVo67zzEYA6+iIbMJfaoxMG8/ANyDIiJHLs+k9bX
	 PvtA3mQCQuQm4MSSct6fOP9DiE0q67KkT9v7/u6yGcflUnKfJym8O4dXZk4J5QyoJ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409668;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=IVSW7dlEtBAkMcVOOPixBHDjudsel8asjWSLmfExFeY=;
	b=ln/7Elik0HceRsya8erH6Hx6mJK0UupxIaODXPUbMgxYuXYFxl/vHXzPqY0j6LIbpoRV
	 nRHSgq8OfHUL7NpfoguQbKhwje7kEueJRJbb0Cz+Md1K5VldMt/wd3mEvxk1r9Rq+Qu9L
	 rD/z1Lc8f8snowjBQ//wOqFghW9AnGuqb8XIMtTDSY5Mk/eFNHQeD397ZDfjVnyuQ6D7s
	 pODJrHrsRBFFShmEHzpGKU/B/bg4S3VVPQjC/QLpGl/nblZCb1tr7tkVLNIaHTi4uv4Ps
	 4f0FLz6SwK7X0+MqoVVEM3ySIn51zPL5O4dQJWAiuakhYQxy+kUQ6ZOG7m2qKfv1cDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VfZrepJ0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24C5606A332;
	Wed, 11 Nov 2026 15:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24C5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VfZrepJ0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D8491576;
	Wed, 11 Nov 2026 07:07:44 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2F9F3F632;
	Wed, 11 Nov 2026 07:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794409667; bh=62Mu4OB+5wrqIV2cz1Z1/DAKB6v44So/0ueSDYAy0eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfZrepJ0INs9KzNnKkWmxJLRps9nRBYmn6mnATtZK6oQjjzaP2Cyyx2TN1dldFmns
	 KnTJe8UyD60giCl785gSW8Jmg3o+OmikZi0qe5odXs+y92IHy7hf9N4u3BnGiR7mLQ
	 cTG6viDoj2FMuBt2iHZiJm0wx8HO+9LXwSRHRZbg=
Date: Wed, 11 Nov 2026 15:07:44 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Rob Herring <robh@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
Message-ID: <20261111150744.GC9176@e132581.arm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
 <14c0956c-904e-4a6a-98a0-882514d77b08@arm.com>
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
In-Reply-To: <14c0956c-904e-4a6a-98a0-882514d77b08@arm.com>

On Wed, Nov 11, 2026 at 12:58:59PM +0000, Suzuki K Poulose wrote:
> On 10/11/2026 15:46, Rob Herring wrote:
> > On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
> > > The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> > > two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> > > forces the device onto the AMBA bus, where the driver must read the
> > > peripheral ID from the device registers during probe. On several QCOM
> > > platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> > > never probes and its trace path is unavailable.
> > 
> > But it works fine on some platforms? We have a property to override the
> > peripheral-ID which would solve your issue. That would be much simpler
> > and avoid the ABI break on any of the working platforms.

This series preserves support AMBA driver probe, "arm,primecell" would
continue to work.

> That is true ! Sorry, I didn't think of the quirk.

If adding "arm,primecell-periphid" property resolves the issue, I agree
that updating the DTS nodes would be better way to resolve issue (for
this case, anyway it requires to update DT blobs on broken platforms).

Thanks,
Leo
