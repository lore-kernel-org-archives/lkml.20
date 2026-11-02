Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631281;
	b=4z4vfVitEG7TlvM2HCo6cxDQgz5TuICGR3afHRjJvsSeimrhPJvGV9vsYBZ5tDXB0hdn
	 Uc2/EKxjE0Ky6JT4Lxy+oc9rmomrifhYn7QDoJ3JUYtM7KRTpRuk7WYiUZZgyMHsmx9Lw
	 q0xaKhfLN3Ivl/HHf7V1m3WmVtl3nw8tEMat0SWPToCUov8K6j349/REdQvjwLXhylNvz
	 VPS+44dNvb1oh5M4uViJcAPZClv5KHC02NkDmQUdlsTSgFpIPWnCVfYVZofil0sFOnOHO
	 cDq3ALa1THBpOZUrFVa9t3l3h89QHzHGUcywIApkWSOGU+UkGKTZF5lYWcDyKmDFk3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jHCujAV4TSmNU4uGy8hxkAD9bn+1UUbLxy5pyDl6AaQ=;
	b=vqTDhAUQv64TOaZDi0cTdIEqKGdu88heoimWtJfV39tgFWgiXGeJ1s5W5YY3IHLWIbtY
	 XO+P/6YUYFfViE/1zY/17Of1CGNps/xEncjMsF8AivF+7oCEDA+EAL1os1tRxanhvIQ6b
	 8SwXCRYHbeS1yj3cbCrs4JQjHaw3dH5GpKw4vQdCgf73FbxmhOiKufBY3UNmvLCh0Wynp
	 Rs6srAylRH7L1Y16/BT6hAdumQRwJAe/GtW8jLgwILSxS5MTZFEcdHU1drvhC71eVk9Sf
	 XFb5wCrBCrjufTOxwYmzvE9Agf6K0xE3pa5SErPqtTD+C75hjuC9MhSzcBYoKdXknrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cN86yOMi;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5D607B45D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B5D607B45D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cN86yOMi
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2156062f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631280; x=1794236080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHCujAV4TSmNU4uGy8hxkAD9bn+1UUbLxy5pyDl6AaQ=;
        b=cN86yOMila6nJGlglpCgsA7s07SCWkeEg/fZ6gkV3Ld08hEZggYkZGc25xvaXkxp5u
         qd2cLSyWiDdzzETazWenIqIhYLhJTzjwkgcA5+U8ktQyt3Y24fmmjZI1sAjx2iMNkLm/
         nKPiFBQuWi9+d3fv1rXbuXPgc16rxpbKIzrjuuLuaUkqFVgwGsGfzP4r1BlOrPiSZjLk
         xmRN1awC7fTcddUh/Pv31c/y7sAN/2OmgL8sS4fcg3oK6q83/ZPcW2Tsl+TL2I8HL7cW
         FdYyIAuL8yiNCAyxnNxkai0Y1lBeNHn1DmHl4TShE4sd9ULwZhZ3uba0WeLJ3JmGGKFr
         Z7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631280; x=1794236080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHCujAV4TSmNU4uGy8hxkAD9bn+1UUbLxy5pyDl6AaQ=;
        b=dNoAiTUw9zDPb3YA+BCbehuStxp0T26QbPQ1tBa6WH7YlO3jbEIhY/DT12R0Rq4j7t
         Gdof92UYVpPbPktQtY8gu+Lwnujpm3iJ0GeIqX9DDw/JXu94W12tXVqmBXwrWzTSYf0j
         oQ+eEyMA0ov688YmU4tI8JQDyoVRku4ffvaQAgHugpqhEtUg1x0npK0wLfcTSFACiD7f
         g/Va0I9acaoMFq3hAAxL+vx7kPqs6zSeP7rhakXaeM+0SHhq626pCGhMQZsjzbdSjwKV
         wgrLSKexexVaadHOKu01Hx7xKMr+iPAtwYp2gxXZypuXZTICj7juzHyexNWWxwZAuke7
         Yi0g==
X-Forwarded-Encrypted: i=1; AKwUvByxVn8mk/QMlFSKOCd6fC5FhaE/qAO87nTL2BntPpA09CVNBITMhvELnS8NeYiLl6cJOVSXRK5PEMxgJlg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/rq9n3lQAaRruByWtqx2sub88yflnsn88sFPPxSmlpPKx0kJt
	P0BxS7sSMvOfinEp1nOB5FJpjQWGU65N/kx6wwsAjZALsD/uHGZQ25T5
X-Gm-Gg: AYBFou0vvsLIDXnRVof7itHIXZ99QAL+Cv0zx3tjb5pz3y1NotCYmtwFYfRghJqA4y1
	LiNaEwhgDcenQckcwFf+WWgwnumQHHve0GcDPk0NLHddZ6x0X9KfYnJmbnBG3ony9Ygk93h/P6V
	CoUN0CjtHPsrEA6tJbZsScJiAclQOz/eQUERVa0nFt3fdJVl5fHVXn5Nc7XR+wTpGpW2EUTPdji
	cTD6skW1zvdw7rfdwp9+JVUBh/eusDBCKRC6hzQBLPDyvMKyrK/HkVUGXvgliNaFgKugZGWBpVV
	TxRcwGIcVZ6MRXTk1oYuat0pA9hPcT5o3sDPmjeApaSGKPE/f1CjUUvDH9PE0HFq0ol6MziC7tl
	sgSPEO/khW/ydQzoRwYypw5DHfCn64ri6lRxcsEjjIfxmxEtYO/uOyV7WQYb4y/wtt25jzTsyM+
	OrGAvBfmq5vnajkhF+vMOepL1l6xjT567n1nWt2u87wn9BYCGwS5qp02eeLsWNSKF7RXIciBEgy
	c3kv/pwjYZcfuu7GSLMPdp5IEdl4GFYL8Ru7cO2BvNp3rH6ObUWenv9+bp8PgF15xI1rND4Lohs
	HxX90h/cuT26kQVeomHDBNgiVNyuu4uOA/P3v9sh3TNqVAnEh7Udqh8Fh8yIuTgVvT0es6b6IRK
	Wc555l/UcfzGIyneWI3VPAPwpHT4Rzsg9iIHIz1edpaH3jpTA5beHVJzZ9md3D2OKx8o=
X-Received: by 2002:a05:600c:638f:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ac17d168a6mr229177725e9.10.1793631279890;
        Mon, 02 Nov 2026 06:54:39 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad5ff8sm195665515e9.4.2026.11.02.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:54:39 -0800 (PST)
Date: Mon, 2 Nov 2026 17:54:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maritu Hone <marehone12@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: fw-management: validate firmware_tag
 is NUL-terminated
Message-ID: <auikK_2xehWSG4eS@stanley.mountain>
References: <20261102141221.87646-1-marehone12@gmail.com>
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
In-Reply-To: <20261102141221.87646-1-marehone12@gmail.com>

On Mon, Nov 02, 2026 at 05:12:21PM +0300, Maritu Hone wrote:
> fw_mgmt_ioctl() copies struct fw_mgmt_ioc_get_backend_version,
> struct fw_mgmt_ioc_intf_load_and_validate and
> struct fw_mgmt_ioc_backend_fw_update directly from userspace via
> copy_from_user(). Each of these contains a fixed-size
> firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE] array that is never checked
> for NUL-termination before being used.
> 
> While the array is eventually copied into a Greybus request via
> strscpy_pad(), which safely bounds its read and always NUL-terminates
> its destination, three error paths print the original, unterminated
> userspace buffer directly with "%s":
> 
>   fw_mgmt_backend_fw_version_operation():
>     dev_err(..., "failed to get version of %s backend firmware (%d)\n",
>             fw_info->firmware_tag, ret);

The strscpy_pad() function returns -E2BIG if the string is too large
so if "fw_info->firmware_tag" is too large then it will never reach this
printk().

>     dev_err(..., "Firmware with tag %s is not supported by Interface\n",
>             fw_info->firmware_tag);
> 
>   fw_mgmt_backend_fw_update_operation():
>     dev_err(..., "backend %s firmware update request failed (%d)\n",
>             tag, ret);

Same for this one as well so these are all false positives.

> 
> If a caller supplies exactly GB_FIRMWARE_U_TAG_MAX_SIZE non-NUL bytes,
> "%s" has no terminator inside the array and reads past it into
> adjacent kernel stack memory until it happens to find a zero byte,
> leaking that memory into dmesg.
> 
> Reject the ioctl up front when firmware_tag is not NUL-terminated,
> mirroring the existing check already used for the equivalent
> Greybus-module-supplied field in fw_download_find_firmware().
> 
> Fixes: 013e66537273 ("greybus: fw-management: Add firmware-management protocol driver")
> Signed-off-by: Maritu Hone <marehone12@gmail.com>

If this were a real bug then this wouldn't be the correct Fixes
tag.

regards,
dan carpenter

