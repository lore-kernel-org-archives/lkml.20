Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708467;
	b=M4g7hvGE1R2aJlkit9Ad3Sa7bmh9Y/DLhf3DKxBz7RZIHB56vq1aDXppBPnHHvTVjMdD
	 ujiTlUv8vZSTQKHv7DawFgRwMlZqyoPowZZVDx71cyjbfeo+BKqYks7epDkdkpAV+d1Zb
	 vugZUOqHFf3NnUC0QmjpZsw8E7qtRS5FZb2xV+2NwxzaJIoBwkF+YYIWRF3j84H/h6QpV
	 /meJih61tGUC0bMpsAHQ1JOiFODjeahYzTGTVO2GZhQvTiO2d+iyGmgyLEW9sNS2oWHIk
	 NMJ9+7hK9xq7Ne607RG1Pb9sr6s+sdclR1yO/CVRiIztl4qxNJaRb26V9quz52W4tVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rnqu5ao9YJwk94NMnB9wLTZ5Ww11Mzaq96WX6a9SCys=;
	b=uDZWig0NV0b4KGN1qHpqRKFZfAEJtuLgnO+dpOBo0f3sRhNquQRwB2SUt/neyDS/e8af
	 F7lT/9eWyyFpeOCfGKxCyIv+yy5wkEHCCIWoREkCEthddqxBS+XJU7n+IANHC22ll01T1
	 U7hdKvDEdkGBuogTRDN2Oc27CzvsSg15MsfIQDWE49w31LKR5YjLJ5E0vbsXzG/Gku7+t
	 LNP8PwYYyIRl7p2k+YJoAW6hDLYh2THowSwowFYm/HqYwaVukMZrHoL4VGtc4OskhSaP6
	 41y+Jleuae8UdYUOh1oDF7V1TQaSLwqMR+0Hnn465I7stE6xusVZa+FfRNCCmiov7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLnlNQK8;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18FE606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18FE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLnlNQK8
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862aca1ed4dso232893a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794708465; x=1795313265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnqu5ao9YJwk94NMnB9wLTZ5Ww11Mzaq96WX6a9SCys=;
        b=hLnlNQK8veP334z+eVkUDAES3G1yQmoS+IwKg8o4QOrZ6P44r8AkjMZlynKd27RZbc
         p+nb1wVMj174+IPPxl8ZBp7Mmc5FGxR09y5xaFBVcsIF2IQaee1ma6hxIbz88svT+mr5
         SyMgE+EeIY8vD06U/mS1vcAuJz4LjrTAHL6vptfjVDeAtuat+fAIJPECALmQi7y9O38M
         BhwxmXVSzb7x5q4nPK3ol/34LXAE4t3yqVJf97ZATIecE+cbI1sOQjsLhYaURc6YgJuI
         vV/WeenOkKeTh4I3Vqb081WEucdnNXZ3sgcwyW30M3qGGscFejT1hmq2KswuO8nwqZgf
         2y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794708465; x=1795313265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnqu5ao9YJwk94NMnB9wLTZ5Ww11Mzaq96WX6a9SCys=;
        b=bxAc9SP4lm/On7oJFZG/Zc+9McAGIv3zExb2bWwWnc0aBWjllhgYzAFSIyAO9xzVUW
         etSbFljGanIQpfFH9NfvabM+HrTXdbkULgSzzVTmfiM+h9JSlVp5OxhxGfsMJ5x1wWmK
         pO5sekxcE5zkxaaR1DIQ/JkeQSi5mj4Zv+NPjDSWvAK4t3SrcU+Eldj2ImGycdFAP6H+
         ZUc21jntdBpcSq9zA5s29A1CDLNhRlfDZve4QxfpCLDEa/MHBrKBCuAdY7jGaf+k783d
         dTfIfNtYGNtF7+axYOq4FFRFDuzweOHfitDjKBGlKr+h8YUG53Mq8i5N+9vEgputnrdD
         ScRw==
X-Forwarded-Encrypted: i=1; AL+hErGbdMippcrA/6qLNvv+jYGukBQlnsVc6rov2uLnRF6XaX1uo9XEyu58jDp/fjyDiKhrzMdUeOETa7qpy3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lvrCAfjUCWQle2OjMnUv6zmGIbmBqjbabeMqGBnpYpRjo/EbV
	dfW7dD6prWRk3c2/XdiMz1NQ4tcvf6NcAMbn9tO2lwK01wAAdnYO+mie
X-Gm-Gg: AYBFou12m10smzuV5YFqcE3DTJzFmue/YQaYddTuJvIdBfccIdF01tMSD3BdwaQpcUT
	APPgak6ZOpEBrLDAbKBudWufobu4q22Yz7lN75Q8PBPLlsmNpfcyu4ZSfYFQ4D+HFOpFoPSnKOk
	vt3n+dCt5hHx59LuTbHLs48BhUoZWyPnZ+rxbIhRATl2ut9pp8hlqoofHKOHJn4CjdCTbRSIQkr
	MGGKVgjQF+TgpIglNlfXLiTLdaEU1F9NXn8+RTd43bTLSL3/OChrX5l1gzzOSFQ0lMPTm4Zo2n3
	tdzZf9Bjj3M9z2ugStAgZYuNhgA5TdAc5lZD5GnQ9f9zDoSCjA+O+QQIGpm5cvFXnU6vDrGWSfN
	4qUlsshMES5UayQ0vfLCObW0QlrDSmWdWDGxD571CdgUKHEavckizX04KqACkfES12gUrHI6gKV
	2YbeKdFlKZi7/QKQwPNhbhGeDxZd03XS90v3ODRqorDsWgwHm7ZHLgSQaHDIoZKVaKgrykGzMav
	hWNFWN9JQZqQV7r1YRSzYax/PP4plQei5SUnl6VvSFyVjSyjx3PUpa6X0kILmX0xP6NK0eXate2
	NkDXcFpMWJ/wC4CEaHkQnKN6DUGhP52c2rJykQ1PilReL2DZsh8E4kzCr1OMfjAqWhCiTGuQSGV
	qZYbOw4czgzhJGpL1QuDApG/HzKvSPkMu
X-Received: by 2002:a05:6830:4104:b0:822:527e:f653 with SMTP id 46e09a7af769-862898681aemr7487703a34.13.1794708465542;
        Sat, 14 Nov 2026 18:07:45 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880a5298sm7113595a34.7.2026.11.14.18.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:07:44 -0800 (PST)
Date: Sat, 14 Nov 2026 20:07:35 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/4] selftests: ublk: propagate stress worker failures
Message-ID: <avkT5yu3hJgi-YWb@fedora-laptop>
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
 <20261111225759742pwhACD8p_0GdXSYIk_Ob6@zte.com.cn>
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
In-Reply-To: <20261111225759742pwhACD8p_0GdXSYIk_Ob6@zte.com.cn>

On Wed, Nov 11, 2026 at 10:57:59PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The stress tests update ERR_CODE in background subshells and use a bare
> wait in the parent. A worker can therefore fail while the parent still
> prints PASS and exits successfully. Calling _show_result() from a worker
> also removes backing files shared with other workers.
> 
> Generalize the recovery PID collector and use it to wait for every stress
> worker in the parent. Return errors from the worker helpers, leave result
> reporting and cleanup to the parent, and reset the PID array after each
> batch. Keep failures ahead of skips when collecting worker exit statuses.
> 
> Fixes: bb2cabf23568 ("selftests: ublk: run stress tests in parallel")
> Reported-by: Ming Lei <tom.leiming@gmail.com>
> Link: https://lore.kernel.org/all/avJ0Vn9G7XhZv-XL@fedora-laptop/
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,
Ming
