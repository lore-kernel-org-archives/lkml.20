Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616160;
	b=lyPMXNL2bRPRbx/26Rwey/hDOM60xFhbt6ktwgsPpAsVKz/sHpufe/7YJBQkzpwX3xU2
	 U1a9QAxBIIxKsnvODV3qa7u+On4BQRlx0Y3HR76E3uIxyxGfjz41dJJ12GgwqBvyOnIHa
	 uFpeM55aRnNJOUdHPMFGoJ65B3IzmK7HAHU4hHO9CHeIxzEAUygMNNqr3FEr7Ec1nhjJW
	 U4Vkd7QwthsLeT5gWm85kWt6C0bHBjO7HsRbDTFj09ENZyZLH38ZbYIr3l1lMGj7Wy06K
	 GEF1MpI5CH7n/Gpn1CUGFOxI7a2pQCdJ/EzTc0cmAVwFYj8Ay2eP3kpN0gAw88iOSZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KXRF5NFKMdcuYVka3K7Jjgx1eiDiSmm0GhEZsRoOLRA=;
	b=f+iPcbwTs0AINhYj2TGrSWvfB4Fi0DzKglOjgJkgxkixa5WPTKa8W3xqaXbMWG0Ldb19
	 nSM+KCtV7sdo2mz04zoiwjX7I/rpCH/qL0Nud9DdYnqnzFJ+7D6pEj9iN3n2QmyMfTmzP
	 OJ5gWMWVptF91hHRtIvmJdbigmngqidui7CjTF7NOolRTjTezsW27LNNkFGK3dH1lU5mz
	 rqOxKdjrJn+yuhVqQt52i5jjA4lxPRF2ZKGYQVQSOAujHEmTXPNSoXe7jiNH1GIMoMGgJ
	 tIAmU6onIAv5DGaCQEEba67YuSEprOgpe9uCGuigIF513JmWELi3/xzT0kcFU/uZwwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9IMkU1P;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75FC60A261C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E75FC60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9IMkU1P
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c37b612635bso385759766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616158; x=1794220958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXRF5NFKMdcuYVka3K7Jjgx1eiDiSmm0GhEZsRoOLRA=;
        b=a9IMkU1PBMw0aZJkr4vlmYRMTKJKENy07bbqu0F/GTo7Ra8mDds4hFqVRdBkgOH9Tl
         kqWWm3QNGfo9+ASMtX5tpuQsHP+hkq7YVjr7iRcdyWsx0AbDncwo2XAndDToL+sJXpvk
         1cpbbTFpFhbiu/ET8uMDCKj1cmIlz1IzZh9RTMO0cE22WK4U/66NqLUENwLi2rj2KOYb
         s3SrL4LA0FJg1JBZcAgHMiCivwFxTJVrP/SHssnt6N3JgHZI4IqaMSpwhjHv+VNtqoy/
         3zWX8HmiG9O8cIl90UwtzZBotjW/JhL599RUhr2k71GA3rzuCDpVcJbqLssLhhlsTuRu
         ziYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616158; x=1794220958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXRF5NFKMdcuYVka3K7Jjgx1eiDiSmm0GhEZsRoOLRA=;
        b=vRIRLNdaMFE3v34JlUsNgQdWMmoYgYtohtxhF+MlsasO0gzZDajV0F+lRawAsH+8gR
         Dxt3M6At2ryBMrVfs42dAeYO9OTPCRmLvyrQo43YFSHnAJq9HGVwEp+ZlwMaIcu9jys3
         aoVqDTEdh6Io+MRYvHXuLqv9AePJYU9IuATvmfyiAVpvT+FN/flS0HpL+5CMxfywOLhC
         zUyP9qC8nm/NE8ew4AvYOBltAqlgcb9+qahteLw/sWkgTc7aanFGzDsbzLu3WTLgIlQb
         gyoCAjFH5+RcA/qWL1I7Wv9X4w4rQ71hKBA7qwMN4EC49Na4ujMYOXb8n9wuWMMd7k4o
         CHxA==
X-Gm-Message-State: AFq9FYL4rb5MVV5NAJkK0PifR9M9qZDWrZJPbpYUC8VePaGtJ8AX/8W8
	pfCMuuAb6TpM5CuKajduw83Umtl0tLqqJSAnFrlqC4ijQetlHvJo9l3D
X-Gm-Gg: AYBFou1CtcouSUdZyEWGXsmmpjjL+t/s8YspVZ+ccypZjx+mn7ItuNJ0SUTDVHIdaPK
	ZhxtZ1o/3HtQ2bPqglwE+aU9ffwA5h81bSePyXtzesxWc5qThXf3CK5980WWnEjYe0uA/DBE6Q6
	8WsN8ZUUcl8JOcLYz25XfO4TP5gsSUdC2rvtYuSiolG0/sN/FaSp33jvnx4ZptwHCFs4UyhD0Wn
	1tv00tdVhgUTmJN2Yum5nK1vYsOnzPnsO4SH4/GdFkfi3m02GT85icgV2FUl9LqgAS7SBZWit8x
	q+7gxQQ1hur4VPNaykXjg2NJKu9ZJAfKom1WuLLnPul6H/epb8oS+zBNAkQU36sclyzCcit0mzs
	fCjNwyGXvNx/zm6JxqiOQM5o+b2MsfXFkoWTIwtENrEVKbX19Yi5lGSe3VQMCSf/TgSkH4iHovl
	NEyXM5OHZixBjeVQ+usvjqjs2ksRPAZ/C8lLFPMCjhLI9myTUt4jGgG70nuUyjXCl3Pr6uLUFq4
	1S+ZK493FMC9VXeo1Mws5T+DrKkZxtXjswJFjuy4L+gFOVRD+zOV8AiWjBdaHNAn2bKKTRQj/gR
	ndw1jaRInCd+m7VgC36RazeQHMbrWPXLLgZ9xsEjg46ozdM/ue0ibzfGzXxUUrpYxn2k8oHzbdm
	+me6rQYYhA//AbrLcrtsJwkEUfRaTso7OhujBtManA4vW7JdJYBgiP/oVsiWQ1tNp7/GsrkDY3A
	+gu9cVA+48gYMFaNJVs8FUFmaRhjff9g5v27yucpMuRgZmxi3/EhPDQhzep8VoyNw=
X-Received: by 2002:a17:907:6d20:b0:c46:75e7:25af with SMTP id a640c23a62f3a-c4ca7a0dcb0mr776863566b.11.1793616158273;
        Mon, 02 Nov 2026 02:42:38 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm368948866b.12.2026.11.02.02.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:42:37 -0800 (PST)
Message-ID: <6f97dc68-b2e1-494a-b0f8-13c36fd84044@gmail.com>
Date: Mon, 2 Nov 2026 11:42:36 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: sg: Fix shift-out-of-bounds in sg_build_indirect()
To: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Doug Gilbert <dgilbert@interlog.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <mkp@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: linux-kernel@vger.kernel.org, syzbot@lists.linux.dev
References: <e68a2050-dc97-4531-95e2-29f4d1a109cb@mail.kernel.org>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <e68a2050-dc97-4531-95e2-29f4d1a109cb@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 10:04, syzbot wrote:
> From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
> 
> Writing an invalid value such as 0 or a negative number to
> /sys/module/sg/parameters/scatter_elem_sz, or setting it at module load
> time, causes a shift-out-of-bounds bug during subsequent device operations.
> In init_sg(), scatter_elem_sz is checked against PAGE_SIZE, but because
> PAGE_SIZE is unsigned, the comparison is unsigned and bypasses negative
> values. When opening a device via sg_open(), the driver calls
> sg_build_indirect() to allocate scatter-gather buffers. In
> sg_build_indirect(), scatter_elem_sz is read into the local snapshot
> variable num. Because PAGE_SIZE is unsigned, comparing num against
> PAGE_SIZE also results in an unsigned comparison that bypasses negative
> values. Furthermore, even if the condition is met, the code updates the
> global scatter_elem_sz and scatter_elem_sz_prev variables but leaves the
> local snapshot variable num unupdated before get_order(). As a result, an
> invalid value such as 0 remains in num and is passed to order =
> get_order(num). Calling get_order(0) is undefined and underflows to 52 on
> 64-bit systems, causing ret_sz = 1 << (PAGE_SHIFT + order) to compute 1 <<
> 64. Shifting a 32-bit int by 64 bits triggers a UBSAN shift-out-of-bounds
> warning:
> 
> UBSAN: shift-out-of-bounds in drivers/scsi/sg.c:1887:13
> shift exponent 64 is too large for 32-bit type 'int'
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
>  __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
>  sg_build_indirect+0x559/0x870 drivers/scsi/sg.c:1887
>  sg_build_reserve drivers/scsi/sg.c:1997 [inline]
>  sg_add_sfp drivers/scsi/sg.c:2177 [inline]
>  sg_open+0x1128/0x18a0 drivers/scsi/sg.c:349
>  chrdev_open+0x4d9/0x600 fs/char_dev.c:411
>  do_dentry_open+0x816/0x1380 fs/open.c:996
>  vfs_open+0x3b/0x340 fs/open.c:1101
>  </TASK>
> 
> Fix this by casting PAGE_SIZE to int in both init_sg() and
> sg_build_indirect() so that the comparisons are signed and negative values
> do not bypass the check, and by updating the local snapshot variable num to
> PAGE_SIZE when num < (int)PAGE_SIZE in sg_build_indirect() before
> get_order() is called.
> 
> Fixes: 10db10d144c0 ("sg: convert the indirect IO path to use the block layer")
> Assisted-by: Gemini:gemini-3.8-flash syzbot
> Reported-by: syzbot+270f1c719ee7baab9941@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=270f1c719ee7baab9941
> Link: https://syzkaller.appspot.com/ai_job?id=1d412b83-5bbc-4d73-b690-4c798d45cee4
> Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
> 
> ---
> diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
> index 5408f002e..46117d1a1 100644
> --- a/drivers/scsi/sg.c
> +++ b/drivers/scsi/sg.c
> @@ -1667,7 +1667,7 @@ init_sg(void)
>  {
>  	int rc;
>  
> -	if (scatter_elem_sz < PAGE_SIZE) {
> +	if (scatter_elem_sz < (int)PAGE_SIZE) {
>  		scatter_elem_sz = PAGE_SIZE;
>  		scatter_elem_sz_prev = scatter_elem_sz;
>  	}
> @@ -1875,9 +1875,10 @@ sg_build_indirect(Sg_scatter_hold * schp, Sg_fd * sfp, int buff_size)
>  
>  	num = scatter_elem_sz;
>  	if (unlikely(num != scatter_elem_sz_prev)) {
> -		if (num < PAGE_SIZE) {
> +		if (num < (int)PAGE_SIZE) {
>  			scatter_elem_sz = PAGE_SIZE;
>  			scatter_elem_sz_prev = PAGE_SIZE;
> +			num = PAGE_SIZE;
>  		} else
>  			scatter_elem_sz_prev = num;
>  	}
> 
> 
> base-commit: df2908090cda368b01ff43709f51890076c56157
Hi Martin, Doug,

A gentle ping on this patch. Patchwork currently shows it as deferred.
Is there anything you would like me to change, or should I simply leave
it pending?

Thanks,
-- 
Krystian Kaniewski
