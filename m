Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442E2E8B64;
	Thu,  3 Sep 2026 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418258; cv=pass; b=UDK4ikXlmoiCi3v5uudiPjgrm4y7Xz6j1Srcr4Ic2k4dmftipQ4V84xkMydP2lUuBTQ4ebJaMJ8b6zk7vAKjWdQLeRiUD73rmVFYmBZFB3bsdkMUJTS5yf2+l7COJk4P8Vg8tMUPjmlhPn+4JaOhME40pP6ZUwRFZ9j1OyO61AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418258; c=relaxed/simple;
	bh=1avM8Id4kbIbDCUCAZt8zhIBEt6VMEp5w3U+WATGHBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0mA3ltCzK+8v8FYZBzllGQ0J3SG+0WYX7rdSEiHyDh/ndNiWSs5/H7JvcHvyd1z+tivHadEjY+HOaIefS4XT71QhYnUFzetXClfvJXK2alG20kfZk5mCTyT6zawrDSnJlIdqMuVRQppzPuMttnatKGjMY3feMLn3UfLbEco/QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=iP/mUZg8; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="iP/mUZg8"
ARC-Seal: i=1; a=rsa-sha256; t=1788418227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Oj5mtDGDWl2NU+yGejaqU6lgE9KyazC8lZoCLTk5ja3vIO7ZRpN92lsAQ5iqSuTgUOafCY+ZumZwWyjFD0jR/dBcrNgVvy4GmirhVb7xAfu3EoxP8m32mUQaj7zAILGpWutfy15hajcI2pwO39s2Ehf6/o00km2DLKcro1OJsEs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418227; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bVRFysRKvF5JRI0gdedHC+kWors6h80025WFIPu9hMQ=; 
	b=Aiv6kn8gOaid7M2GJJ9EOvtMe99Q4v2IUuzDE8hadYydJ2OQFb0/DgWuV4mwODUQ5UKZ7UqUkC/NHGHWM0eOcC/vuIYCuB2PPIGUckk2vo5WLx4eX29A9ZLGskc15uDGw54XSD0d9BXFqTfvWcIYzx64fdlzxuCInqdJc925gik=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418227;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bVRFysRKvF5JRI0gdedHC+kWors6h80025WFIPu9hMQ=;
	b=iP/mUZg8GwltKlv3vjg4vDNEDTRS7KFqE18GrRc+1KneY3T0Xbm14185s3y1oi5J
	iMpRdy0q59JIFA5yOf4DE3Mdm0aDRGMN77UCO4U84HJqN8Sw+cwfWRJgoPHwA4OXego
	eUXnehft3hWOJ6GnZ/gdNx25FWRmyuUZhCCxZqsE=
Received: by mx.zohomail.com with SMTPS id 1788418225291596.2712766780835;
	Wed, 2 Sep 2026 23:50:25 -0700 (PDT)
Message-ID: <14072655-72f2-49bb-bbb2-7d009dc69804@collabora.com>
Date: Thu, 3 Sep 2026 08:50:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] media: v4l2-ctrls: validate HEVC tile counts
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
 <20260617021906.2746743-2-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-2-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/06/2026 à 04:18, Michael Bommarito a écrit :
> The stateless HEVC decoders read num_tile_columns_minus1 + 1 entries from
> column_width_minus1[] and num_tile_rows_minus1 + 1 from row_height_minus1[]
> and use them as tile-loop bounds, but std_validate_compound() does not
> bound these u8 counts. Reject a V4L2_CTRL_TYPE_HEVC_PPS with tiling
> enabled whose tile counts exceed the uAPI array capacity, mirroring the
> existing compound-control range checks.
>
> Fixes: 256fa3920874 ("media: v4l: Add definitions for HEVC stateless decoding")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 6b375720e395c..6d478e1a5ef22 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1242,6 +1242,18 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>   
>   			p_hevc_pps->flags &=
>   				~V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED;
> +		} else {
> +			/*
> +			 * These count the entries the stateless HEVC drivers
> +			 * read from column_width_minus1[] / row_height_minus1[]
> +			 * and use as tile-loop bounds.
> +			 */
> +			if (p_hevc_pps->num_tile_columns_minus1 >=
> +			    ARRAY_SIZE(p_hevc_pps->column_width_minus1))
> +				return -EINVAL;
> +			if (p_hevc_pps->num_tile_rows_minus1 >=
> +			    ARRAY_SIZE(p_hevc_pps->row_height_minus1))
> +				return -EINVAL;
>   		}
>   
>   		if (p_hevc_pps->flags &
