Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669886;
	b=j2F5vBHO5J2b78vbrEJyTtK1+lEXD3YSDiZcj8NC4Zf3NqVuwTRgemOH86siXXbKdUEs
	 W91y1MPEOOtJ+r/RCA1d8DZyyQOeSNBvNU/cJ1F6WSm4VnNMIPpL6bPfwrrfahc1XDnXg
	 s6mZABjoVY6/tMof5P7YplleTlDU0/UirPd8+uycBnuSlWS6dXVWQA9obWOmp+97fC/zr
	 Ajb1daZo6g2F2YZElw+Qk1/v4+Fc4NlsjlLu1rxcV6P61ZptOuN1V7pp/zrPAjXGYuTpZ
	 C8JFHD+wbNKaA0NLvLtqnN2rtU58+jJqemoQdOvMmsYtqZozK1l4lVbVjkl7Bssg8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=;
	b=kAHDW5kRYBksCTt6jnLH5Dd/o5N/Y5bTviAr/HUCitb8WUKImIig7WMewY2w8MnL/Fx0
	 nS0o/0pbi85KwgbPiSelcOLX+gk2O5Ys7+m8PfLAMfkBO6nofKB6p5uO//x9w8aZmj8rL
	 L4PoQo1ryRLEFdr0MKcaXqMGql0Orj++E9pRUvJ/M9/IKjMA/w50uKj14yj9wGVmtkpp3
	 bPGwBCckIwHFN5bD3quA+FMD3kqltgASzNeBathnqG3V5F4iyJ14ihYLoH33PZIaD8c/m
	 OHvF44Rl/b26hqNNqp/054o/rpXIKFN5WIxabd+HxKZPh5LzCFnjC+xPwgFbjOwsjbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BJmlrutD;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B45606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B45606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BJmlrutD
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e10a70540so1059909f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669885; x=1793274685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=;
        b=BJmlrutDH4Bepk7izBYBkebrA6NRUkSljExzOxyO8LnJ8w1p5tZ/d7vrJfg3j6wYya
         aIZWmsN7pjuxCtE9/vZl+JP63R7r0rb0nJei3kg7hxz5ZokW9vVFmH9F4W7JamDZ4M81
         bmxt5BS+nxEOg3pt0M5Z2fpxz1/v/cfkklfwh97m147uoqKNbkXLploXRuXOjUj5SyWl
         iYS/zLnqzQD7YU6zKDdkHhRTBKm0jPExk7u5BrJYJEXrvujlD9e3stcRjs9MSiaXXtMN
         Kt2FuXgqnlQ/Re/s1FTHxT+/nxPUJAeJrBeOiJeOb52JRywBqQNVlI0xpWqmc0S9BCsF
         wI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669885; x=1793274685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TXd5dPmQW/FdjoYQcFG1PodSXgdJZsvkRdQUDNsOjE=;
        b=FLYXlAiAGFdVZMnuY1Xdo4/q+tH1YvQye1xVS/20pwDaAW0geVOCsBcCPcTHFU/Sr7
         EVXcojo0PeAKzmj1B3JcxSfxCAJ/WTtGY8CjLdyODUKT8vQeTdGwqX+vRBO6RN1BVWnC
         rCDRAkkPL19+VASH8YbIKvxADoJpcxXV6rE10CBkpzj4XxglHE9PWgt5L5BlAc5hG8/5
         XqnFrp4uXNumYH33okrQL4qBYbYSA9GleX2tvG70/pYF7lbuUSyVn6lzSFrpEzfHpFm9
         O2zz7hFpkmvoyNCxHIoGooEewj7B4FwOjhp7EkLjxcrABYED9X2x2GHeBJXPkSpYVKMv
         7eDw==
X-Forwarded-Encrypted: i=1; AKwUvBwQb54c778IlL4YnGz4lD9tBEaa5GaGBm2QBLzbgh9Uv9H8yHjSWhCgVYzUxunoUMLSDSo1V3/+4gilMXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjvnWjBitd1pRTSSlQeUAMGhZo5PHLqSh+eDE0nSe/ei8TW99/
	VPxPn5FprBwvCOfRtHkdnp3UdPZwZY/2JU1SVI4bOZoVdiHIqGiduyCq
X-Gm-Gg: AYBFou2+Auc/ZGY0P96vMKgj3VtkORNrOV26a5z0RA8/yeQOY0P0SnN6qgIuDEJE0om
	v8VK9jM4xRoLgavk7R/nYAXG4sMsm5oQYM1Q12BGaB7wUOnkuGqHgiItUpe6WBq+bmUcLD39rBR
	kUyOKcElOtnfVSOBTDyxYqVt+xuehjTzrs05nLYPXcLkZzOCIfrjlBdIl21B33vcqTSooBz5a2q
	GO86CNTDwjbRdJutKK9u2sY8aSj/8wAy5oH67gVk5WNEZBZdslHLIM4Ux2hVD1YCoOoOBgfzdHb
	Ygr4w/5OlM2UX7nMMgZts+DeGmbXxo9IvK4+yr0JrQflOLQTUx5EeL1FgfarvO+oz/rDTph35ko
	iWRGee5bHwlWv9Dra1KzVlngy6zYkBiZ+SyotsCQNlu2u+k1/aKoJsTYtUn27FE3ZaUCZT+2zHJ
	SAm9BcwvZPqdoKAAzykDFT6Qm6/ItQ8nr8mfPx1IX6Ij2vEbTGYrMFwvXtSC5+2pa0tFVUTdrf/
	xM+CUHORIj6syjpNaIAJ9QCxOCvR/IDKhGq/7nHUfLOqHIX4jz5Haom6lW2Yu1WNc3UoOoi3BQz
	9moTry6TkIDjO9rr
X-Received: by 2002:a05:6000:1864:b0:48d:f4b2:b29d with SMTP id ffacd0b85a97d-48e264e8a10mr10554202f8f.53.1792669884742;
        Thu, 22 Oct 2026 04:51:24 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm11722358f8f.1.2026.10.22.04.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:51:24 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:51:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Message-ID: <20261022125122.75a0d528@pumpkin>
In-Reply-To: <20261022102020.107609-1-ninadnaik07@gmail.com>
References: <20261022102020.107609-1-ninadnaik07@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 15:50:20 +0530
Ninad Naik <ninadnaik07@gmail.com> wrote:

> Replace the ternary case with min() to pick the smaller of cap_len and
> req_left.
> No functional change intended. Compile tested only.
> Found using Coccinelle.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>  drivers/spi/spi-mtk-snfi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
> index 6e96e50fedad..bbb65a21a684 100644
> --- a/drivers/spi/spi-mtk-snfi.c
> +++ b/drivers/spi/spi-mtk-snfi.c
> @@ -1017,7 +1017,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
>  			if (req_left)
>  				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
>  				       buf_fdm,
> -				       cap_len < req_left ? cap_len : req_left);
> +				       min(cap_len, req_left));

If you are going to do that then join the lines.

David

>  		} else if (rd_offset < snf->buf_len) {
>  			u32 cap_len = snf->buf_len - rd_offset;
>  

