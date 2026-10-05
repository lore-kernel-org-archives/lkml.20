Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCDA47CA81
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201944; cv=none; b=thOXv6ugp8p6hL/XUImLaFoh6yDRT2gfFVoRDfI2uJHD1XCJpQs0PGMOsW3opIOeraQmGfkW9/NfeL6bYOJkK/WaKTKJ0hfUJtRaYiqMuTBGzdRA9wI+kFaQ3JD9Qd/TdRP4bBUEusFqWZv5JOjraxYXsNs0UdqdwgAh0OxM3F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201944; c=relaxed/simple;
	bh=0BoekvN8/3SqeIbH5DHVtTC9EZ2w1qDVqlj3X9YirTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmtQCacW3whLV/I8B0UcJNtSP5iVzaKxkefGPqBd/Awo96S1z7lzPphvaLN2LoTgMHD7j+gZaDk5tqv+KbJvveIO2fboHSvD5Rp1p0IirXWvS3xz+6uKkHLpQsTpYfIeOvlQU2b8PWMQH7Bj6HF3kEuwCNszVHnkjZuwKj7gvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m0r3i3BL; arc=none smtp.client-ip=95.215.58.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m0r3i3BL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0BoekvN8/3SqeIbH5DHVtTC9EZ2w1qDVqlj3X9YirTg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791201940; v=1; x=1791806740;
 b=m0r3i3BLI64nt+zqv7s1Z6Wx1hX86c1G7R77YpszHVq7FFBbRocQjscGO3t7Tn0zgHznJ+tu
 akYR1byhgI2Pk4dob0K+DD09nrnNaFJ4NfZWjf0KvFCIHxgmSgj65I8xdZ9f+68E9gdG0AmWh1J
 tznVBaxOdguWrtwT2vFsLxx0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e71401cd4f018fc7;
	Mon, 05 Oct 2026 12:05:26 +0000
X-Mizu-Trace-ID: e71401cd4f018fc7
X-Migadu-Flow: FLOW_OUT
Message-ID: <fe936feb-b6bf-4d78-8cb3-d9ea61707a23@linux.dev>
Date: Mon, 5 Oct 2026 13:26:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] soundwire: stream: allow flagged BPT firmware
 download while streams are idle
To: Syed Saba Kareem <syed.sabakareem@amd.com>, vkoul@kernel.org
Cc: broonie@kernel.org, Sunil-kumar.Dommati@amd.com,
 vijendar.mukunda@amd.com, Mario.Limonciello@amd.com,
 venkataprasad.potturu@amd.com, yung-chuan.liao@linux.intel.com,
 anson.tsao@amd.com,
 "open list:SOUNDWIRE SUBSYSTEM" <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261005091620.1390916-1-syed.sabakareem@amd.com>
 <20261005091620.1390916-4-syed.sabakareem@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261005091620.1390916-4-syed.sabakareem@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index f710e5932b4b..9a3904f42078 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -1005,6 +1005,19 @@ struct sdw_stream_runtime {
>   * @bpt_stream_refcount: number of BTP streams currently using this bus (should
>   * be zero or one, multiple streams per link is not supported).
>   * @bpt_stream: pointer stored to handle BTP streams.
> + * @bpt_fw_download: set by a BPT-capable manager to flag a resume-time firmware
> + * download (BPT/BRA). BPT and active audio are mutually exclusive on the bus;
> + * this flag marks the one narrow exception -- a power-off-mode resume where the
> + * codec must re-download firmware over BPT before its stream (left DISABLED
> + * across suspend) is re-enabled. The manager guarantees no audio stream is made
> + * active on the bus for the duration, so sdw_master_rt_alloc() permits the BPT
> + * allocation even when idle audio streams are still allocated; an actively
> + * streaming audio stream (PREPARED/ENABLED) still blocks BPT. It is not a
> + * mechanism for running audio concurrently with a download. Written with
> + * WRITE_ONCE() by the manager before it enters the stream allocation path and
> + * cleared (also WRITE_ONCE()) after the transfer; read with READ_ONCE() in
> + * sdw_master_rt_alloc() under bus_lock. Single-BPT exclusivity
> + * (bpt_stream_refcount) means no concurrent writer races the lock-protected read.
>   * @ops: Master callback ops
>   * @port_ops: Master port callback ops
>   * @prop: Master properties
> @@ -1045,6 +1058,7 @@ struct sdw_bus {
>  	int stream_refcount;
>  	int bpt_stream_refcount;
>  	struct sdw_stream_runtime *bpt_stream;
> +	bool bpt_fw_download;

nit-pick: I would add this one line above to leave pointers and
structures grouped, this would be nicer in terms of alignment.

>  	const struct sdw_master_ops *ops;
>  	const struct sdw_master_port_ops *port_ops;
>  	struct sdw_master_prop prop;

