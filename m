Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223463;
	b=uXST5oD9epTJW4ZxDgazic1ches06RMlhlc8heKdzwkkyjonE4VwWdssijvJVvYjBTcE
	 cfY++WELEjYJ53/SqcZiimJF9fKNwwWRtpJa9ADaPuNmse6sYc66O7Sfp5S4Qe0f/9dan
	 DqxesTua5F3BqmtlWOQopIP6fjvlJHMje1xP6Lu9jFk6Mz0E7BjgaawEGHY9gJx1aWDVp
	 hISI7CN1Was0BWcZppQRqBHjIehvIBQpwGvjhwejVSWw+MiazdBfxZ6y/68dydpncEtSn
	 St1AyfEAqIuGaTkY+nYDzRmbulPuGsLvzLgKLBLU+b82wasR8sFLeGfkGLfDS281mlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223463;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tFD8H7/Nf5JeT+e6q4o34Y6AjhivafUR1oDuRLAxRhU=;
	b=Y16ZZxbWAodvgUYNYMRUMKfdC707oqN84KmhKR3c9h33o6tL3YPXAu8rI3W5tsgT/v2q
	 JbLqn3glxclPTnQpJhvSJ146YvHMxTbkAqcRHfL4eJlLFyhevEFn9XBqgl4/QMYO99Y1s
	 8p2stcxZLJtSu2KcK1M783GJ+FTvH2C6+4Rhzy5hQRS3fkbT0My3+aX+2cEpwtMfPqyLV
	 ZpFLjf3W1jGYiHECCMw0g+xIuRDA0VIf6R3t9IAA45CMYNwBz7DloaVUJgM0hivftGnI6
	 1hfkoxnyIcpqTBXGaIu+lT5KEpg/bgrm7m+FEPawaoQSMWf7SfXaR5Q3ftSCxjWDRoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="qqzgU1/T";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C41D606D808
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C41D606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qqzgU1/T
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93E6C15A1;
	Mon,  9 Nov 2026 03:24:14 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6F4E3F85F;
	Mon,  9 Nov 2026 03:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223457; bh=nln0kc6BV2hVEOB+OzjO0M5oIPooIl65a2MP9PKOLIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqzgU1/Te1nE4uHICXX1D6uD1aRILPNmfWR7J4CklpJLGkpH98tO/qJ/+awqKJ3NT
	 lfuRJCA/W0kRxDr6NARzrMPThFmpUeK21ILVARV/rxq532g8Q/oytcFWxlsQnZlAcS
	 8HAev+FwynDvfflxJ5htPJImwVP8AFAN/bCdA+gA=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: tnoc: fix trace ID path assignment failure on non-AMBA tnoc
Date: Mon,  9 Nov 2026 11:23:54 +0000
Message-ID: <179422341589.3275439.2394715793875768560.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
References: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Sep 2026 17:41:43 +0800, Jie Gan wrote:
> For a tnoc device not on the AMBA bus, atid was set to -EOPNOTSUPP.
> trace_noc_id() returns this value directly to
> coresight_path_assign_trace_id(), which only treats a literal 0
> return as "this device has no ID, keep searching the path" -
> any other value is checked against IS_VALID_CS_TRACE_ID() and
> rejected. A negative atid therefore made path assignment fail with
> -EINVAL instead of falling through to the next device in the path
> that could supply a valid trace ID.
> 
> [...]

Applied, thanks!

[1/1] coresight: tnoc: fix trace ID path assignment failure on non-AMBA tnoc
      https://git.kernel.org/coresight/c/bfe43f1d7905

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
