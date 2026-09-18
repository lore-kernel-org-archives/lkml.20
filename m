Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FC8502D76;
	Fri, 18 Sep 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744995; cv=pass; b=BqwJtBLdFJU63poOrRBWdT2YEOdvnXLld2XN0ccxU+TxF+xt9uKebegcN1sBl1QcazzkM4aehXQHpAYQw2/saaiy1SneH2qga9uB/Kr/KZQ+yLu5xDnRRLCn47aCwQM3TG/hYoSAbTid+448vygsuETuJsnBwxJXRXcYP2dl8aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744995; c=relaxed/simple;
	bh=X1v/a6rjAIqgYl9WkTmcQX25j0Zf7djUzf4UutAd8M8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGSneb7xeCOv/LGdeGB/4sY9CLoGfehXhYoesd1dePyZPggfggaYMB5LOMoNr4a7ARjcNRrPcEKQG4EtLtAaWSTmPjauKLz8/qHq4Hg6ClobE0jAu0/XrXnxIwoA3iOb7cmO7feWbU3lmYUr9aU+oXsL1tg1bxZaBTwzW1kk+rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=g0gd5AQX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="g0gd5AQX"
ARC-Seal: i=1; a=rsa-sha256; t=1789744982; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qd/q2wVpxFcI3/WRIZ3tBdYsd2EoKb6XVtzU0JfS4MGDd+t2dLE1roaIP9XdmpACzy+o94UoDQt9s8xbtrAmt4oVs/Kmom7VlhtODLRhN0pcpjoo30Yerm9U91drzGGeCJz2xlWb3YjxxbO4qq/+1V/TBdlFyBvdroSzMFHuANQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789744982; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eFPCf8D5M1X5rx99UIXQoQ9iwlwi2YMPh/PDLFzLuus=; 
	b=Gga2xjjA3q7CrkP8uzQjeRtnsSEZhTfWZgKsJV/dfwl3T4xyHZA7/ARoLsCS4wbry+Nq7xyglb0YTpv0RAD5nEU6G+diYyvxL0ZZcaP1NgoQCLfHGx5NrlHljixzu05YvJIgbnkoU1+76/n+Em1sTmfz67I3nlTYkcpirf7N7C4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789744982;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eFPCf8D5M1X5rx99UIXQoQ9iwlwi2YMPh/PDLFzLuus=;
	b=g0gd5AQX8gvsnb84joQ4GMx+VOlotLGfUFb4Sn9YJIbCFwwBgNRY53+uqKG55uvo
	gKAWCDHb7bIGyMXemgg0gA5Je4Cqd90rBfKKW6CjfTSZnOJNLzW9n5Pa+z5OwJfyHCh
	pLQlB7caar+Sd6hxOwxYR+P8P7tUHCmPuH5qyhTg=
Received: by smtp.zohomail.com with SMTPS id 1789744980496928.7914211499516;
	Fri, 18 Sep 2026 08:23:00 -0700 (PDT)
Message-ID: <fa2f5b96-a44f-42b6-91b4-5895b57b4f53@collabora.com>
Date: Fri, 18 Sep 2026 17:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rockchip: rkcif: convert timeout to
 secs_to_jiffies()
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260918-rkcif-secs-to-jiffies-v1-1-110f336750b0@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260918-rkcif-secs-to-jiffies-v1-1-110f336750b0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for the patch!

On 9/18/26 15:05, Amin Gattout wrote:
> Use secs_to_jiffies() to simplify the code.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..f82eaf9a37d1 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -314,7 +314,7 @@ static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
>  
>  	stream->stopping = true;
>  	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
> -				 msecs_to_jiffies(1000));
> +				 secs_to_jiffies(1));
>  
>  	if (!ret && stream->stop_streaming)
>  		stream->stop_streaming(stream);
> 
> ---
> base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> change-id: 20260918-rkcif-secs-to-jiffies-1b98a96465f7
> 
> Best regards,
> --  
> Amin Gattout <amin.gattout@gmail.com>
> 

