Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921381;
	b=bE0FzgJYw2vOpxUGuY+75HFk1diLDg9K53wrld1qc/qdBMTVPNXMvuxjxtISc7VJ/9RY
	 Ugr/6KcvlPPziSiTv3kD85MtBEC2vwsAthFMdQdqDBsmlH+8jxrmWDq17zRDDdhOLsvYS
	 IHUKuU4rd+XpxUMPM1GsmZMbAbHGDHDjCEMaSGcnkDNLdSPfyi/iRp0lTKMMlUb37Z/pl
	 Lc4VrmoLvFGSv32QkZW9w3+QS6W8xXTnNmgSimZBkm87XhvhI4qKo8NHiI22BzAQXzKYo
	 C1E8vIwUkVWK5EyA6ELl/QbCow+vKKSbr57Q2B7HwJo8Z4U9Lw6wyxBXTOC2jY44vAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=;
	b=twIkkdLq3Y5yHiomwvnYOys0FfFUI/hsAEB01TinbIymRePc+z6N2+ICKug5D0uVdUHp
	 0+Qc2qviEEBa1d6Nc/Ewp5tdXizlhCOPemUhxsWWLANqS52Yk2bMztL4Sd00FXdGM5FDc
	 muS7rk7cL590/B05w4Z02Y3grrgzk5SEbXFLsqh7oF0PYKFT2NJgelLoAxpfeZVna24hl
	 lNkOPZcRSdqYM++WNTj4R24DzjGS7wNivXsoL+10iqwaQHkobbeKZ9w2zARU0LPFAnCPU
	 BUT92kkpusJKGHQFxN2nroWtnKv0pBtNajuL5i0Pqad2kcRwRN5tn70iQqXLOj2+I/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9xDzHcN;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EA9606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EA9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9xDzHcN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so48551965e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921379; x=1795526179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=;
        b=R9xDzHcNtbAZjwxTgsRkpU00vR8dAcHdR2bQUcQMgXtJ29uPBNV5HvCf5l8rQttRoU
         j50+31s/MFCrwGtfCl+1y1JZbqGiPIOubKvNZyDPqfxwKninTM8eq2b6GncLMfzT+paE
         auuFwus4cD3ZKr206CdTVtqE+/XtjBNqgQt3JG+oJk838roaYk0uVLe3DmJkuF169GhD
         bGS1VT4+smy7G8XNBXg2mIFncStLasLSYFX6NxXHCa1heoQv2Ty4p9ebOqPruauNJqKE
         /QkRZTitMwIz85KaFilZbGSvvn8cXZzZ9Hz6PCgNNkIIr1qTyr65bFfoZO+qCiScLF9x
         qD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921379; x=1795526179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4adGshk3DcGvhqFeQZWKT+ilTqCtanGq6mRdY2JYAuk=;
        b=A52z8Nkvpxzqcx37AXPapNPtxaPc0hN0+JP1ikxaXG+hBr8SSm7RrMDqVFpOeJQa8/
         Ap3UI//pJgjaPcYefNsoPAAhsjQI7aHKNiMQMPgkcCXdLkpaN9SSHddyYyHgKxY3pJWO
         Y55PrNmh9sfV03sgJUvNOcmy/zdWenWCg45iY4DpG78W+wTuPCP7Piv+0zBjposZcWXK
         4fESHHRScJzz08dc2Kns8OB+Hny1w36+Wp7k9MV6YBQs8yIBrGNswJeQz2EC3bBOOpPc
         oL6x82YF08Kv+HzqbdymdVpn6izf/gH1hf8sjlKBHMhiuuZycdDsgNgJwapZseE6A8J8
         ixKQ==
X-Forwarded-Encrypted: i=1; AL+hErHB4VZ/aWwunoeyLffuBuDElvl0B69fYVL2D3spnC2SbG1AXPeAyuyEJfDWbi0TBeBDN4vIG20EfMcIiko=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wr8rsb6qfHMR/wgOrVitnfGbfa1mjOj8kvPU5GsahqzhGVYcY
	4N5unuLTV8LfdVMg2bAgo5lNGnNtjTeQLbp6/Qz6P10J+2+r7nEaZez5
X-Gm-Gg: AYBFou0c9YlhZYvlhpEgUkndg2S1bRoS3IroeCF7XTJ8J3RoQw15gxvjIBn3M+TqH3u
	tA1g143tX5qvPSiwsVBf4scD4YAIy3FEsdNktwMkn6x4AHet/+30lF49s3q7MLlAg96PVUtrVK9
	EPrjgTqypqgLiq6ihYJEkHqmff+pXA1lsPWqPo5DjVy1mdyVfA6xO8Bp3pZbwLKGIhmfmOpfG90
	dyBhfi/gTVVIJGy4PEi1tx1iOiD5YSO6a4FNOl2AtllU4Ll44U5s18dlMGNEV2PAyStB7QBL0pM
	uXetrkJEZr9HAP1ILXpWWm3J+tdceGox9ZVFbeo3I5uioaFiTvswqMDcRrgGyYtYsObTOBR2NaO
	9HqXiZPL9WH+kWqJTIzQE3/j3HclZhEiZ12PkaoPqfD3v05lFj6JXIle66FND6f9Xvn8DsvBOZC
	dKJ/+OsgxL0eA4eX1bOgbmv0T9veYZE2XLo8ih30XK5pyGED1Vefj7SFR+uo7hKTy3q8hIr+WaB
	TGjH+KC4l27XU0EiUfcduKDm5BsCXekh5xvJPQ1+sSFidnAy+7jeGmNYbsoFUo/nI6XVlahPyas
	IpsGrUhR/OXlwnfG+5ZXnRSGsFNlnj/g7SFyxKUG91rtM4DP6/7StbNJ7nGCWtuQ+Q==
X-Received: by 2002:a05:600d:3:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb55a50eacmr238269805e9.15.1794921378994;
        Tue, 17 Nov 2026 05:16:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm26817173f8f.21.2026.11.17.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:16:17 -0800 (PST)
Date: Tue, 17 Nov 2026 13:16:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL
 terminated
Message-ID: <20261117131616.0a631d5c@pumpkin>
In-Reply-To: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
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

On Tue, 17 Nov 2026 13:09:47 +0530
Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:

> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
> 16-byte field and does not guarantee NUL termination. A 16-character
> name fills the entire field.
> The driver copies this field into a 16-byte buffer and subsequently
> uses it as a C string. For a non-NUL-terminated name, string operations
> can read past the end of the buffer into the adjacent groups pointer.
> 
> Reserve an extra byte for the NUL terminator and explicitly terminate
> the copied function name.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> index aba129ead04c..c778133fadc2 100644
> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> @@ -29,7 +29,11 @@
>  
>  #define ZYNQMP_PIN_PREFIX			"MIO"
>  #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
> -#define MAX_FUNC_NAME_LEN			16
> +/*
> + * Firmware returns the name in a fixed-size field and does not guarantee a
> + * NUL terminator. Keep one extra byte for the NUL terminator.
> + */
> +#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
>  #define MAX_GROUP_PIN				50
>  #define MAX_PIN_GROUPS				50
>  #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
> @@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
>  	 */
>  	zynqmp_pm_query_data(qdata, payload);
>  	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
> +	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';

Too many constants....
You might want to try embedding 'name' in a structure.

Then, at least, you can use sizeof().

David


>  }
>  
>  static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)

