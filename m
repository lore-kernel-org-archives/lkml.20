Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794916343;
	b=ujJB/OuWGlfk7CPdF5ohu4teEyqmfU2O0YMYfgG19AljSPFWTjVTR3ZF31TkugmXEoMo
	 9FAQd0zF+/ds4iOOD0ql41onkEaTlErPeOW6H0nJtN2YopsGohncBh9iHPw+npEqY/uVP
	 eAefW/uNx1Qv0hSiKUK1rg28QCNMvrhq+Qxd1XW4j2Ipa7lzNg7o78E18UF7jiMLXXHds
	 6aVjQavpYK9Ejeyj/9T27ZNQehena5+6xZuxQhzsK3omacHOLrgEMni7kSCEPdh6q5jZ8
	 eHOuIJ15bQ8z77gUT7+MQjcJ513vdU9twNi4phH5j0DP96ESx1upuvGANyrnFpo8Xbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0r/m1mAfbKgiD7yOB9oy7sj80T9BKokzsNI3WwDEi/8=;
	b=JpbWVB0leplvOPlMCr2jO4Mz8zkPKyFGfGUJufxIZUpJiinebkt6CQqp5RVkS0Y1oVeV
	 lIjBH9nEph/m5JbVwPTiUnqrtt39vqfMyNXGv5LvfvvAUpWY0kDxEA6b4O2UoOz2TQrJ0
	 kv+Y3nwZ2aBHQcbhui5KP29IyjWlv7EoJkpLF3nmkZkHKmLfe2s+kPPMaHGPNEKAO69J9
	 ISkOQSzx3LFBazk22zFed2aGolkJFAHOONN5/OcCi32TkDNlR58ih42oK8XlvKugK/byA
	 9nail56LdZI2dA+rYajJH/7CyEeRnQ4Jq5iyTjfW884UdzBRN78FhRtB0NExGeVY3lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JM/ndeT6";
	arc=fail smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7ED606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B7ED606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM/ndeT6
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9d7791b00so45438025ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794916342; cv=none;
        d=google.com; s=arc-20260327;
        b=Onvp7AeHwMX45Q5OC7JkwrMg0v6lksag0y66HPf6opcXljeuGeuYRYAbASPYMvNQrF
         YzwZiH6oJdpClOfAhnDDCqE8Y9KV6Tlxp8n8fEM7xU80t2BGgCcwkRgmlZQ4VdX63wLk
         IKue6NNxauZfbqScKc8PxuKZC4BqcMB6F/b0QA98spwsZIxN+ss/d8tCIfK/NLSncXN9
         lTmsngx1mvboieDv0CEDPGyAMqop3R4rOY0Scb/acOqSCTmChIhI3IwgRpuRXOIy2lc8
         DdAqKy4jyY81zQtmvGVsw98+d+SWsJDTCVpE73Pm9cD62mK3oD0vhE1p6QTYHcYiEm+x
         H7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0r/m1mAfbKgiD7yOB9oy7sj80T9BKokzsNI3WwDEi/8=;
        fh=IN7FTxVMsIJo4DCTjnsZUVddsC3R9fus9iOn1Yw6/wU=;
        b=jwO5InPEV8HoRNqddWSIM2Apl4AKmje02Druyr9wrwIo97DinIDIr7ncdIBgejYCgV
         OpAPzLrx+WtaQdA/Ghi0j66OP/2jjtgdcvxN2ob6FSKRlVAwXLxQsvnyQ3N4hTqdfS3Y
         2s6rdBAN+EonkWctjRnq8GEy6LUqFnqIHIiL/3PZYnukrBvo1cQahHOAmLNy/PHaCuSQ
         EPDgXbXOe4qup/GiFHBo0jeTbhjQG5Pa/CeTNWmkbFuG5BynNYnHvuNxARoHvVQzN+L1
         MAp/JNf/TrkkpYwP2SPzkyTB9lGb9oiIdVyXh3RKTVNcklSy9XSeitKAyEdN+eYwm9o1
         12Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916342; x=1795521142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0r/m1mAfbKgiD7yOB9oy7sj80T9BKokzsNI3WwDEi/8=;
        b=JM/ndeT6tufj/RSHKfG4OpDX8e7AIeExc1cVqzayA5ozUtzHsxHJt0K+5HaA7+UvRb
         Tmf2c2uv92V4BLS6mm3vWtQs+ol7CzFWT4ILmbVLw/OBylUR7R2HYVxNHsJU6vv1Ez/v
         UOPUNf+PSdMFeMouDMhcRg8T7+kJJ3JdevvTdx2EtxWMt2jkbNtAuIT0umlo2dJ239W3
         6HrTUZpaGXBx7d3HXxjBbYRWaVo5G6mzQU4Aswdspn/dY4tODJvuc/1mye30C3MZS/RS
         +Zxhrb1Uv+OHNp7vw6acsMdlGqoGdXuZJZV3w7/iBTeBTIJKvLt2IPefIqC5SNtjSNAZ
         Zfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916342; x=1795521142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0r/m1mAfbKgiD7yOB9oy7sj80T9BKokzsNI3WwDEi/8=;
        b=oSTJjjVfQdH9ed2IS9XmFjiF6Gmvasp844YOSTl5RLnQy4LBywRWzy0tH6ded2dSil
         W7HncIjb0dMq6x6gUwpmHgwIJ+xKxbjACJxcOpCOERtIyKg4HoAJDRzcJdZdgksAL1t6
         dz4qhqp0cB7HTiSa2giQ3hKbrsrHIRUPCMKnS/jebCaXpMIDDcD7lChOBR6bCgk/vOik
         G9yRZuCVgM3kk3ULheNC7YnZxn+B4Q0HiayOZiTNtL0uy11+7GyH/yNnCVmQhpv98eci
         q8teQpR0XLStFFAN6kPZwXIG8Ty1/6NDjV9Xcu10DPk9yaiZsZuZfW+Cgvb/RQAlSfUy
         5rlQ==
X-Forwarded-Encrypted: i=1; AL+hErEJ2E9Ly6klwgsyKZMPe5yaFIGgETsKk3pg/F6JoMBv4bI8mPuaB5mQux0i4ot7O+4nJQGpgWhS96E37x4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rzV5UxqLk0EMH6hR7JHV2HmnBvM+3CJVHt9twwW4aaLn2kxHM
	4N2uiWtlhKYtJviIYy6T158TEZNTUCDgwC1P3E4qhFptfK5uPJiiBN/ny9wgNVZ5fiq8njqJBfo
	rdmAKqZSe181wBRsiX7Y2WdmAR6xFzo4=
X-Gm-Gg: AZFdTZe5BjNMrOwDI0BBGmZmp+rV0sHy/qByFuHYm86zjibfZsxm4Eufo5TRGAndZpz
	LAeucBJliqIr8cM/jf7Kdi/+x5n5VGDM5ZlyMqehFBem7gQ4APRBtBMyJuiwoTFfchN3u9ZuN1s
	0VvAa5AcIUQIeYdbT0f+gRtSQBcZ2oSplIiaCYatLtBnSKxDMFteULcjkj/hpKfyXSG5NI0cdkf
	ZY66NSQl0Hxr2PQ93zPwQb8fydbMS2/BcaHx26xwl60erDnNHx9PhBWMcfPwcff4KoHHanPIJ0s
	5I/8jTpMyadcQKisJQvS8UkkMOPt0eAyc4DFO3S2dBcznp/EOFbOtEZ3vK6Co7xli4U5lIc8bx1
	iu7ZFaMwVaGlbaT860YHPorBvplXKHa6JmgGz0UiGbxdo6nXvavcjfQlU+c8YiaWy2w==
X-Received: by 2002:a17:903:4b28:b0:2ef:da34:7575 with SMTP id
 d9443c01a7336-2efda3478f8mr25625925ad.69.1794916342499; Tue, 17 Nov 2026
 03:52:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112140101.647-1-adrianhuang0701@gmail.com> <avsQKLgi9bqD51W8@gremlin>
In-Reply-To: <avsQKLgi9bqD51W8@gremlin>
From: Huang Adrian <adrianhuang0701@gmail.com>
Date: Tue, 17 Nov 2026 19:52:11 +0800
X-Gm-Features: AclHuK_YP7jGU0mfHFtcV45lYkePktMNfOxs8gWCYOKlclcpX8iMtc-uS_KjPxk
Message-ID: <CAHKZfL2UmshKugf9uPBHK2xZnNNifRfXdT686-cj3SvN0PzkTg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 1/1] fs/proc/task_mmu: advance seq_file
 position on interrupted VMA lookup
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, ahuang12@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:37=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Thu, Nov 12, 2026 at 10:01:01PM +0800, Adrian Huang (Lenovo) wrote:
> > Commit 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under
> > per-vma lock") introduced the possibility of returning -EINTR
> > from proc_get_vma() when the VMA lookup is interrupted.
> >
> > When this happens in m_next(), proc_get_vma() returns an error
> > pointer without updating the position index. Consequently,
> > seq_read_iter() reports:
> >
> >   seq_file: buggy .next function m_next did not update position index
>
> What does seq_read_iter() 'reporting' something mean? It feels like you'r=
e
> trying to make this into something bigger than it is.
>
> What you mean to say is a rate-limited pr_info() output occurs, and when =
a
> process that _has received a fatal signal_ (!!) somehow continues long
> enough to try to output more data, you get an pr_info().
>
> The relevant code from seq_read_iter():
>
>                 if (pos =3D=3D m->index) {
>                         pr_info_ratelimited("buggy .next function %ps did=
 not update position index\n",
>                                             m->op->next);
>                         m->index++;
>                 }
>
> Anyway you should mention the fatal signal requirement clearly.
>
> >
> > The above buggy message is reproduced by the following command:
> >
> >   # stress-ng --vma 0 -t 60
>
> OK I could reproduce the output locally. It seems that this run results i=
n
> fatal signals being sent to the processes triggering this output.
>
> > Update the position index when VMA lookup fails, as required by
> > the seq_file interface. Also save the original position in
> > priv->last_pos so that subsequent iteration can restart from
> > the correct address without skipping or repeating a VMA.
>
> We don't really care about skipping or repeating a VMA for a process that=
's
> about to die :)
>
> We may as well do this but better to just hoist that to share code.
>
> >
> > Fixes: 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under per-vm=
a lock")
>
> This isn't really a bug, it's really cosmetic to be honest. So not sure i=
f
> we need a cc: stable hmm.
>
> > Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
>
> See attached suggested patch that makes the comment sane + hoists the sha=
red
> bit (dropping a silly existing comment).

Your suggested patch is better. I verified it on my side and it works
as expected. Thanks.

-- Adrian
