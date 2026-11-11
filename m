Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386934;
	b=Z4np71GhIayEOVUPnwQgY7SdiigBBzh7tQ8Seu6thN+9HBG+tmkPOPQqIfciLKuW31cG
	 ykT81usk5WX/r8oJPYYdMa8gKf1+52ZfrxaOemlLUNB89TBtZ6SZFTQe5gV8y96aHrf6Q
	 wzC1fxpaO6wZSdLpXSpZsKoMTiurxbOg9dn70L8/OEDLHPnCKTRTi0Yk1j82JV38rUe81
	 WIda0GW1rPHAT5vasLubpdGXesswn19b4wu3mEgGgkygBTic350dk8IuAxSDmsvWntnn4
	 xZFy7kaz9u33hJlEs9D8BcjWY2mQopXBVe/WQnEWmUQfmNqo7cin73dQ7D/MlGORl2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386934;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=h2mcr5qbrOkUwIV5FRHs1EuG1w/QzbTvgXeqDmHoSzk=;
	b=W4ShI0Vk8BLN8WuMPv4NNRXc9F8qVzzQEcFR0P1lwK5Z52JKgFBI0kb9YNc9cPpDaGDf
	 ILwT0929Iw8aPWBm0H1OBwxn7T5a9h7WDeXtQxQfvRNMHrll8LEFChAmAs4BTa+ITx7iX
	 lLBAJ3sC7t/Pm7KmyaxHJcRIRQiHrEYjCCY26rD+wXnvnciJFUsLIopV8tud8QiT1+Jen
	 roKlvJNUzd+cWTOzcrYQt7SVJ6p5VgCxY7nJ3WJjBV5/NkzVmigCsHnUy1aHyMPHEKoXH
	 n1TsI8A2HvZ6qVOKLMOv16F2J6ws1f17e3cFmKTQYaU0a5xSciP7hHlmRy5QxXTxGcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=U1cKfgCf;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42626606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42626606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=U1cKfgCf
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 31C521D28;
	Wed, 11 Nov 2026 08:49:37 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=U1cKfgCf;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 530742389;
	Wed, 11 Nov 2026 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1794386931;
	bh=h2mcr5qbrOkUwIV5FRHs1EuG1w/QzbTvgXeqDmHoSzk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U1cKfgCf+cUC6kWzElnJ7F8K37tf+3IWR/rqvGDC9GXlLbJznxzVxA04Qy9LyXdoB
	 WIVHSxJC7vK5enUiLXT0APS5Ad9mcAnJScPlpNU0u5yWl+jWYv382wEnHei2AD100h
	 3+QOFfeId+gydGRwrqrK7ETZ7eJ72B3vvdhS9ar0=
Received: from [192.168.95.128] (172.30.20.190) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 11 Nov 2026 11:48:50 +0300
Message-ID: <b54d213e-dae1-4d4e-af1c-c28c5a6cf84c@paragon-software.com>
Date: Wed, 11 Nov 2026 09:48:49 +0100
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
Subject: Re: [PATCH] fs/ntfs3: validate log replay bitmap buffer spans
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260817202941.1635505-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260817202941.1635505-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/17/26 22:29, Jérémy Jean wrote:

> do_action() derives the read buffer size for bitmap replay records from
> lrh->lcns_follow in u64, then stores it in u32 bytes. A log record that
> covers more than U32_MAX bytes therefore allocates and reads only the
> truncated tail while the bitmap range checks still compare against the
> full u64 span. ntfs_bitmap_{set,clear}_le() can then access past
> buffer_le.
>
> Keep the span in u64 until the read size has been validated against the
> u32 ntfs_read_run_nb() interface. Also validate bitmap ranges in u64 and
> reject lengths that cannot be represented by the helpers' int len
> parameter, so crafted bitmap_off/bits values cannot wrap the existing
> u32 arithmetic before the bounds check.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> Assisted-by: Codex:gpt-5
> ---
>   fs/ntfs3/fslog.c | 53 +++++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 41 insertions(+), 12 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index f038c799e7ac..21d89de96ba1 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -7,6 +7,8 @@
>
>   #include <linux/blkdev.h>
>   #include <linux/fs.h>
> +#include <linux/limits.h>
> +#include <linux/overflow.h>
>   #include <linux/random.h>
>   #include <linux/slab.h>
>
> @@ -2967,6 +2969,35 @@ static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
>          return o == attr_off;
>   }
>
> +static inline bool calc_log_buffer_size(u32 min_bytes, u64 data_bytes,
> +                                       u16 roff, bool align, u32 *bytes)
> +{
> +       u64 bytes64 = min_bytes ? min_bytes : data_bytes;
> +
> +       if (check_add_overflow(bytes64, (u64)roff, &bytes64))
> +               return false;
> +
> +       if (align) {
> +               if (check_add_overflow(bytes64, 511ULL, &bytes64))
> +                       return false;
> +               bytes64 &= ~511ULL;
> +       }
> +
> +       if (bytes64 > U32_MAX)
> +               return false;
> +
> +       *bytes = bytes64;
> +       return true;
> +}
> +
> +static inline bool check_if_bitmap_range(u64 bytes, u32 off, u32 bits)
> +{
> +       u64 start = ((u64)off + 7) / 8;
> +       u64 end = ((u64)off + bits + 7) / 8;
> +
> +       return bits <= S32_MAX && start <= bytes && end <= bytes;
> +}
> +
>   static inline void change_attr_size(struct MFT_REC *rec, struct ATTRIB *attr,
>                                      u32 nsize)
>   {
> @@ -3114,6 +3145,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>          u16 roff = le16_to_cpu(lrh->record_off);
>          u16 aoff = le16_to_cpu(lrh->attr_off);
>          u64 lco = 0;
> +       u64 data_bytes = 0;
>          u64 cbo = (u64)le16_to_cpu(lrh->cluster_off) << SECTOR_SHIFT;
>          u64 tvo = le64_to_cpu(lrh->target_vcn) << sbi->cluster_bits;
>          u64 vbo = cbo + tvo;
> @@ -3225,6 +3257,10 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                  attr = oa->attr;
>                  bytes = UpdateNonresidentValue == op ? dlen : 0;
>                  lco = (u64)le16_to_cpu(lrh->lcns_follow) << sbi->cluster_bits;
> +               if (lco < cbo)
> +                       goto dirty_vol;
> +
> +               data_bytes = lco - cbo;
>
>                  if (attr->type == ATTR_ALLOC) {
>                          t32 = le32_to_cpu(oe->bytes_per_index);
> @@ -3232,12 +3268,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                                  bytes = t32;
>                  }
>
> -               if (!bytes)
> -                       bytes = lco - cbo;
> -
> -               bytes += roff;
> -               if (attr->type == ATTR_ALLOC)
> -                       bytes = (bytes + 511) & ~511; // align
> +               if (!calc_log_buffer_size(bytes, data_bytes, roff,
> +                                         attr->type == ATTR_ALLOC, &bytes))
> +                       goto dirty_vol;
>
>                  buffer_le = kmalloc(bytes, GFP_NOFS);
>                  if (!buffer_le)
> @@ -3717,10 +3750,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                  off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
>                  bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
>
> -               if (cbo + (off + 7) / 8 > lco ||
> -                   cbo + ((off + bits + 7) / 8) > lco) {
> +               if (!check_if_bitmap_range(data_bytes, off, bits))
>                          goto dirty_vol;
> -               }
>
>                  ntfs_bitmap_set_le(Add2Ptr(buffer_le, roff), off, bits);
>                  a_dirty = true;
> @@ -3730,10 +3761,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                  off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
>                  bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
>
> -               if (cbo + (off + 7) / 8 > lco ||
> -                   cbo + ((off + bits + 7) / 8) > lco) {
> +               if (!check_if_bitmap_range(data_bytes, off, bits))
>                          goto dirty_vol;
> -               }
>
>                  ntfs_bitmap_clear_le(Add2Ptr(buffer_le, roff), off, bits);
>                  a_dirty = true;
> --
> 2.47.3

Hello,

Sorry for the delay.
The patch was applied, thank you.

Regards,
Konstantin

