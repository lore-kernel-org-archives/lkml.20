Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908A92609FD
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791010608; cv=none; b=twfvkvuLcTXqsXqjSATjxr7N1OorHVpDxF6bl9A3wA9DpkaMk3PdcEzEpK+2aaNj5MtUWTAFjuXmA8hwJAsNHu1hB6dzWHD+kJRgwFCjSC+giTHezQgZRFxml3M0076W0wPe6csOfnzs/edimfpOd2j559sUdMruxxmCb1vxRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791010608; c=relaxed/simple;
	bh=yGRTJM11lPHqEAQCmI16d80x3sFjPSlkt3Eyi59eG50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMq+qC/y5HF5UXXM+IFCaUlM2SduM3MEZZEGQGcYIT25gOlBq5czyQMwVPgg28WVZTSIqegTRW/lERma4eniPgah9JNsbO7Uz8Qw/Yen/26UVEBk8UY2STIJ38iJ/SvIJzqsyEnxRXziSmo7DXsUUDPTX4eoYFCxxcoGOVVXjMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ONuKuNci; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ONuKuNci"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78DDE2F;
	Fri,  2 Oct 2026 23:56:42 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 68FA63F763;
	Fri,  2 Oct 2026 23:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791010605; bh=yGRTJM11lPHqEAQCmI16d80x3sFjPSlkt3Eyi59eG50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ONuKuNcizlGzNYDJFxNVPzOBceTDLx5lM2xdJ7qmFsTpy8Mo1er8c27FcBXGv6+1Y
	 lXgWh5atiJ4MXFXvhiMr0ZZfHV+z/5aAvEX5JR3rJRl4/7HuQoIoYzcUqn5FmTjZnB
	 g2OFkozb5o6buo6bc+QZFm7kD50V1XPK2Gj0hSls=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RESEND v13 00/14] fix several inconsistencies with sysfs configuration in etmX
Date: Sat,  3 Oct 2026 07:56:34 +0100
Message-ID: <179101052919.1709951.18400347613609410532.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
References: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 Oct 2026 03:52:12 +0100, Yeoreum Yun wrote:
> The current ETMx configuration via sysfs can lead to the following
> inconsistencies:
> 
>   - If a configuration is modified via sysfs while a perf session is
>     active, the running configuration may differ between before
>     a sched-out and after a subsequent sched-in.
> 
> [...]

I have fixed up minor checkpatch warnings and subjects.

Applied to coresight next, thanks!

[01/14] coresight: etm4x: read-back TRCSEQSTR at disabling and prohibit modifying seq_state while enabling.
        https://git.kernel.org/coresight/c/a373952d86cf
[02/14] coresight: etm4x: prohibit modifying cntr_val while session is enabled
        https://git.kernel.org/coresight/c/76b21c25a5f7
[03/14] coresight: etm3x: prohibit modifying cntr_val and reset while session is enabled
        https://git.kernel.org/coresight/c/88eaf963853d
[04/14] coresight: etm4x: fix inconsistencies with sysfs configuration
        https://git.kernel.org/coresight/c/b2131cff7224
[05/14] coresight: etm3x: fix inconsistencies with sysfs configuration
        https://git.kernel.org/coresight/c/950cca5352b0
[06/14] coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
        https://git.kernel.org/coresight/c/4f7701c1f0d0
[07/14] coresight: etm4x: introduce struct etm4_caps
        https://git.kernel.org/coresight/c/a2cee9814137
[08/14] coresight: etm4x: exclude ss_status from drvdata->config
        https://git.kernel.org/coresight/c/b5022acaee3b
[09/14] coresight: etm4x: remove s_ex_level from config
        https://git.kernel.org/coresight/c/d6fbf353e35d
[10/14] coresight: etm4x: rename local config as curr_config referring drvdata->curr_config
        https://git.kernel.org/coresight/c/f5e6bb291eca
[11/14] coresight: etm4x: rename drvdata->config to sysfs_config
        https://git.kernel.org/coresight/c/30f946375269
[12/14] coresight: etm3x: introduce struct etm_caps
        https://git.kernel.org/coresight/c/7cadafd5a12e
[13/14] coresight: etm3x: rename local config as curr_config referring drvdata->curr_config
        https://git.kernel.org/coresight/c/da1ffcf6bb43
[14/14] coresight: etm3x: rename drvdata->config to sysfs_config
        https://git.kernel.org/coresight/c/3663b4e9875b

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
