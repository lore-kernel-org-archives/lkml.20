Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635758;
	b=ZgP/UjzDgmUgGeKHUVRAQNVhdYN44eh2J1yBeNzSrHX78XQOm2rFwbTR6K44EL3j89pz
	 UraKDHSLZwq1De67N53FvJArsn1mYw17uo87y6jsiOaAHQG3Uj2ignz+gt7hdLv7hfk9/
	 +JlCnYM+2b+UHGj+MPxR7mizMzMajkA749qUsiKNuCHHdeLXPS2N/u8P4tVgAsNIZmHNz
	 TPEPxriCNgkTFeiS6TxGymZsYHQCOSv0HcXlVMiKs/LRlWXo5NBVTNF9SnJrCQVkN95Bo
	 UEGktEuWNul0k3D7XtvvksT2oTQzU3K9ajVILKbwUK+H+JILsdBx61jLrpMSicRWUbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8OegtZIBdrxCNPYwuOWjLYx5fVAeu/sW3/BrFkWBbk4=;
	b=wTjYHaeke0oT9BVlzyJU32/jsDzqMSlwheyWQx7VNtgm9PqvMqj3oRFbrJk4flYr+Hyl
	 PeixqW/AJVvw1Y8Efc9xM3r0ol2tnpCGhpTi3Si5cg6cHd1T1/lK0G3QY2Lj1pgtY0JKu
	 EVatW2cuwY+mt2ilnglPGJVOFfswqGV+LfVg5zXuXkLO1OYZhTsZkQRmhGxK3cf0RgZzg
	 ujHNyWdYuY0a9pdCfK/3hxWDTrpwgLjMRukOErMuF1md02Bt3H0FbE4T3mgMKCv6QQ5ns
	 NLZJYgG/nRm6c+MbYk1pd2laUKtVqQRKlRSkbVY+04DmVTbqfi7J5Je9VrtUapFGezQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWukx82v;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C70606A909
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70C70606A909
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWukx82v
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so3081684f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793635757; x=1794240557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OegtZIBdrxCNPYwuOWjLYx5fVAeu/sW3/BrFkWBbk4=;
        b=KWukx82vMuB2GAg44zNgZHzXQVMKAYknc3cIBwRMDdHq26u5ZGnj9ONzRjDMnVlVF+
         A+U+zorwnZ+0f7Spwhx8xqJbBsHQWbWg/2OHXC5nnyx8IlUbKAOGYREh6LliqWirg01z
         9b4VBKWQ9RfQpspkioMkSPDDCukIt7j5pVZtvu3gqOY7vppeLZs79uYRW65PSTjnHnUZ
         fwEuPd4w/IsDNqq/dCD2vyuIZSfvlPeSZj8U8OZvx7TdNq+N4h9VMjc7zHSOKVLqClai
         xQpNeCemMR2z+L4HJsLljbaTMIOrpNOWZQv09UvK3SmIsSAePTMsC26PEnrpBmj0hW0T
         UPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635757; x=1794240557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OegtZIBdrxCNPYwuOWjLYx5fVAeu/sW3/BrFkWBbk4=;
        b=Pzm0vbcgiEMC8FTrbtzgv2cckpKyv/0JTgjrunFVJJREUEPHC09Kp8KsnyWmI5sGrO
         DKndEOQUqF/Gs2iS1xiMKqSqNh7TR5uESewh0v+vqPmwfwZY4e7XhGNXlsvvTiBYlM/w
         7fwT5gMjy3nt+RpviwhLsngwOlXdbFb3sDqkNvNNuM1qMjfnAdCE6jrYUecs3SzpMDcB
         rbfctoToKJoxbpc8q8rxE+i0bpl3pjkfLKDnTNUKr6VRdzAwPq6wghoCVs4RUixGLNEg
         2uE/Yfv/SD0vRTtx/ifK6o4aKTEyjuFAxJn/y7U5kUrHHx+qIkU/pI7MvsAliSwwi+Ce
         QNcA==
X-Forwarded-Encrypted: i=1; AKwUvBzM+/hrlZRXPxpHdOFrj7/+r4FC8G2DargbiXEijGhP8UMbLh5ofr72a70o0YQwsB2B/ZqwQYyYQ1AcdE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xfOePKJvZPoR8obq8pcYAEEDlB+Rr94jjSaeBY5woJdySo4WZ
	GG6WfTIktPWYL5eVSsJl39zsmctWPyRBX5eNNEtqmBQgElbzxsU0dz51
X-Gm-Gg: AYBFou1Sgrzl3bYPI7c7B4EVmVYn0rpI9xbvIxVqttBn0npXS7HffheTqUNQxcKdVMX
	uMKtp3WGtW53wCcPPFUl4VF6ITz36MhN6vkdyt8wdRRMPRRLISksETwgcViACbb5uLbpl2QEUaR
	kouWv0Y4HUs+iM8GBtTbii+UsVHMJnfJdgnE8WMHwxlIl9GQGJiuutxpg2efPNM+oXT/JGqlAww
	CcMSAc5sVYzuYkrPlyJdDPiQpY9Pb4kLBF7IjGZHk6WqsmSmcpmr7EYsVK8wOoEZXxYbko7V/c9
	7e5wbVRMaS1l33DFYziyiX31edUlZ2Nh0Z0PE5mpy8ut3aXlqDr6yi2OF4FRl+WFOhVbuMSekXx
	aH7vzm3lpf2ijhPotwRG7/aLnHF5F76tWAFqvIJeNwzz/wQxpmI/RMPUqwXsypGBLKw/pQKkKgF
	rvQslzRmAZz27+HLJHTDqQBEHCwNW2uQFwVYmSpP5+i1hG7eM3kZIF1GNqWlrN4UiDie9+/hDwB
	uj09/cc5ANxkb/fWgaaxiCHctBPvA0qviuMv0fcYsKLrPl+DuIHIySJBL2wpemzQFosv2WB3FRR
	wwzldENnBFOKqK61j5znS5I=
X-Received: by 2002:a05:6000:2288:b0:48a:f404:6960 with SMTP id ffacd0b85a97d-48e6e2e76a5mr23213517f8f.9.1793635756592;
        Mon, 02 Nov 2026 08:09:16 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba2415sm21300844f8f.50.2026.11.02.08.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:09:15 -0800 (PST)
Message-ID: <936b8e7c-37e4-42fc-8ec7-67280aa93333@gmail.com>
Date: Mon, 2 Nov 2026 17:09:14 +0100
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
Subject: Re: [PATCH] x86/mm: Define the zapped-entry checks only with
 CONFIG_DEBUG_VM
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Xu <peterx@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>,
 Rohan McLure <rmclure@linux.ibm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261102144001.342837-1-kas@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261102144001.342837-1-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 3:39 PM, Kiryl Shutsemau (Meta) wrote:
> Zapping a range calls arch_check_zapped_pte() for every batch of PTEs,
> which is every page for small folios, and arch_check_zapped_pmd() or
> arch_check_zapped_pud() for every huge leaf. On x86 these are out-of-line
> functions whose only content is a VM_WARN_ON_ONCE(), so without
> CONFIG_DEBUG_VM they are empty, but the call remains. With the SRSO "Safe
> RET" mitigation the return of every such call mispredicts.
> 
> Declare and define the checks only with CONFIG_DEBUG_VM. Otherwise the
> empty inlines from <linux/pgtable.h> apply, as on every other
> architecture. They cannot be inlines in <asm/pgtable.h>: VM_SHADOW_STACK
> is defined in <linux/mm.h> after it includes <linux/pgtable.h>.
> 
> In a KVM guest on Zen 4 with Safe RET, zapping 4K pages takes one branch
> miss per page fewer. MADV_DONTNEED of 1 GiB gets 6% faster on anonymous
> memory and 8% on shmem, munmap() 5%. THP is unchanged.
> 
> Fixes: e5136e876581 ("mm: Warn on shadow stack memory in wrong vma")
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
