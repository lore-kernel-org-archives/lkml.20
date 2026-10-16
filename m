Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDF24F85D0;
	Fri, 16 Oct 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166808; cv=none; b=ejU4u7Gw4M6JMKzLquOhxexJ8q7LpOcu7/6IJzGhxCWVhnUPt7//ISsRcPpHwTHqd5ENspQLLI7N9r0xEOwuXAgkg1k6BVppmt+m8rgpIYyYNRG9Foa1wIlpiHb79KzRhGbCkKq1eu0HeTEz2WVYEkCX7htGjQ1Z9uFX/5FgHSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166808; c=relaxed/simple;
	bh=7viwu1kcBwPuKKsdYWp530CoRwyUQVc1fFhZNJS4SOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmgXa28K3KmzIW+rZ3B0TISOamdzmgidXmNnbUHXBVZKq5lPhCO6JjFR5AnnydfNwytDo7TtLLhZpOn//tgO7uDiWjMeTfqQHHA5s7V72JChcLh/hWWDR4A7XOnruaYoasDbU+S7Fldn4jS8eEAO1mTEs0JCf+xXaL2QKkwcpXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xHkS7-0000000086N-2vvQ;
	Fri, 16 Oct 2026 16:06:39 +0000
Date: Fri, 16 Oct 2026 17:06:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com,
	xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] media: rkisp2: Add statistics capture video node
Message-ID: <atJLjCV3Z8V7DsqY@makrotopia.org>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-3-e91ff0a604d6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-rkisp2-v3-3-e91ff0a604d6@ideasonboard.com>

On Thu, Aug 27, 2026 at 07:48:32PM +0900, Paul Elder wrote:
> Implement support for getting statistics out of the ISP by dequeueing
> statistics buffers from rkisp2.
[...]

Hi Paul,

Comments from running the statistics on the RV1126; the RK3588
statements are by code inspection.

[...]
> +++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp2.rst
[...]
> +:ref:`rkisp2_stats <rkisp2_stats>` metadata capture video node, using

Undefined label, as rkisp2_params in patch 2.

[...]
> +                const struct v4l2_isp_stats_block_header *block =
> +                        (void*)(stats->data + block_offset);
[...]
> +                                printf("ae_lite.exp_mean_r[%u] = 0x%08x\n",
> +                                        i, ae_lite.exp_mean_r[%i]);

struct v4l2_isp_stats_block_header does not exist, the header is
struct v4l2_isp_block_header; and ae_lite is a pointer and %i is not
an index (ae_lite->exp_mean_r[i]).

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
[...]
> +static void rkisp2_params_hist_big(struct rkisp2_params *params,
[...]
> +	default:
> +		WARN_ONCE(1, "invalid big histogram base %x\n", reg_base);
> +		return;

reg_base is uninitialised in the default branch (clang warns);
block.header->type is what you want to print.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-stats.c
[...]
> +static const struct v4l2_isp_stats_block_type_info
> +rkisp2_stats_blocks_info[] = {
> +	RKISP2_STATS_BLOCK_INFO(AE_LITE, ae_lite),
> +	RKISP2_STATS_BLOCK_INFO(HIST_LITE, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG0, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG1, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG1, hist),
> +	RKISP2_STATS_BLOCK_INFO(AWB, awb),
> +};

HIST_BIG1 twice, and HIST_BIG2 is left with size 0.
v4l2_isp_stats_init_block() then writes a zero-sized header for
HIST_BIG2 without advancing data_size, the 256 bins are written after
it and the AWB block overwrites both, so user space never sees a
HIST_BIG2 block. With the entry fixed the block shows up on the RV1126.

[...]
> +static void rkisp2_stats_get_rawae_lite(struct rkisp2_stats *stats,
[...]
> +	block = rkisp2_init_stats_block(rkisp2, pbuf,
> +					RKISP2_STATS_BLOCK_AE_LITE);
> +	if (IS_ERR(block))
> +		return;
> +
> +	ae_lite = &block->ae_lite;
> +
> +	/* TODO figure out what the other channels are for */
> +	if (!(status & ISP2X_3A_RAWAE_CH0))
> +		return;

The block is reserved and its header written before the status check,
and v4l2_isp_stats_init_block() does not clear the payload, so when
the bit is not set the block goes out with whatever the buffer held
from its previous use, done flag included (every frame after AE lite
was disabled through the params node, for instance). Reserve the block
after the check, or clear done and the means when the measurement is
missing. rkisp2_stats_get_rawawb() has the same pattern.

[...]
> +irqreturn_t rkisp2_stats_isr_eof(struct rkisp2_stats *stats)
> +{
> +	struct rkisp2_device *rkisp2 = stats->rkisp2;
> +	u32 status = rkisp2_read(rkisp2, ISP_ISP3A_MIS);

Is the 3A interrupt on its own line on the RK3588? On the RV1126 it
shares the ISP line: the measurements complete early in the frame, the
ISP handler returns IRQ_NONE for the rest of the frame as ISP_MIS is
clear, and the line stays asserted until this clears it, about 1400
unhandled interrupts per frame until the kernel disables the line.
Leaving ISP3A_IMSC clear (the params handlers set it) and reading
ISP3A_RIS here instead works on both.

[...]
> +	rkisp2_stats_init_vb2_queue(vdev->queue, stats);

The return value is ignored.

[...]
> +++ b/include/uapi/linux/media/rockchip/rkisp2-config.h
[...]
> +/**
> + * Same as struct rkisp2_params_hist_lite but for big channel
> + *
> + * RkISP2 parameters histogram configuration block.
> + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_HIST_BIG{0,1,2}`.
> + *
> + * @window_num: 0 or 1 for 5x5, 2 or 3 for 15x15
> + */
> +struct rkisp2_params_hist_big {

scripts/kernel-doc warns that this is not a kernel-doc comment; it
needs the "struct rkisp2_params_hist_big - ..." title and the other
members, since the header is pulled into the documentation.

Best regards,
Daniel
