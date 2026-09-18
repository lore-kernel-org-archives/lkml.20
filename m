Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEC53E44ED
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715779; cv=none; b=d74ah2bCV85IRPXu3Pgayp7whzBJWw6OuHXqpQi1UQfSm8cRSYli9361p7Oep8VFRYSQ0i0NOx9hujrFOaNGUuc+0eaDenvuwIehC0DtY8R3t12ThNBFVx7Jl1fY+IbOAq6fO8jTR1wRrNKjFEmFGHslLwcV2v0bwZA+fkWm6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715779; c=relaxed/simple;
	bh=mhUyMvHcN4TX949sQh/esZBXP5LhyBsWejVcPg2AphE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBZvwvzHQhpRvz9kIoIzO2qqyKyCY0iJVOZosL7PuAmchO3BngA+QLpY3V1IdrY1+fENneZVnnr9iHkq9Iqvw5LX92u4Mju+FjWYjr8xMlh5Xjp5EfJZ8EkBJFUGEEK8kY4OCfetpSjNMG+Qk7bkm4H5g2pujF3cNyfg24B7lZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963a787c9so110350e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715776; x=1790320576;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bqMe/meCGvroxGnBcwNhNK9UqrtwhnE2+lm9mYH3a/0=;
        b=0dsNTxTUPl/7huHGLhzebx805qxiZbIPRx1VlMkaUHqsgOLwcQeeuA1gXXScvys7rZ
         u6SOzTZeYqddx8j0/NGoocdYBYHiVbs/wtquDBWu13jX4TIipgMxXfZtz4trwEDdgKkH
         U2DpmiCUx7Fs0xlm7/oKHFPBw7T81lHbGrmlzWbQRZKVEKVYcDCqPxSjVRhrKLAtmUvs
         OZWHr1xzeEBaLVBm6G3Q2LVgxYAdI5hWIzTHuesG3abTQDaacn3i2b2uOzugAGrMDbc7
         tigfLHGuxeDQ63bM9vIhFNpPc7SYkG6ThT2NTIUzVPw2nb17tdUvzJmmd4tUEHG4mstp
         PgKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4aMAQOm3zDNvEv1UmoURqub6XkLULoCDGAzjqZlPJEhtCvHpsfxxcp2Cy86P0fMVZLiIhcKWJhBJS3t4=@vger.kernel.org
X-Gm-Message-State: AFuF++m3KINvRZHWBYnO1NDYeIXvwr38r84uZYGiqNJyMYy1gePO+6yq
	jnPs5HDFTGXYysRD+VJnmAHlAoLMkmcsch9TjMN4Pn9dFoe8DvQVZTERYyw/fkFI
X-Gm-Gg: AYBFou3PyaziQ7cFZBqJi5na1YX6C/bmsVkaOMoCy9ymrPxDpsQWA0UnLI5G1iCdn4j
	n3KLiv3xYL8A8RLEM8D1V/l3wPu2hlyPFW3BGDPmhZfhOFxEI7Ye8j0fhRym9uA/mEivkvYayup
	KPUb2QC669ZLE+fGYW3XcY5hS/DEt/CggmPLxlXI7es3Uo+T7etJ8U5kkyM4JlusCgsX52fazEe
	kTxeO01RfniW9G/BA0gvdI+OWwPXh5STNFDjHTCT3de4Qr+c0Y9JEbmYOm1wFUXEMkUJ6KKn+lh
	oiocb8K4U7oDeZysmZbJCfskUuYhZe0beKy9tV1RTdIIDL8ftq94k8ANMxY7GGt1iagTBP4sspU
	7fywRDysQoPKovQPid8WnHNi57V7uC21nRxmUf/8If0tiUOt2cFVpMDs0nTev1NcntliqjXib+z
	BvAd2F/GIWGxCmDoIrwVF7kN4ik+CX2LVJyIbUYOOi+GZx+vrxgtrHKkE+jFYVn/7DwacTy7352
	fxS5iH+PxAJdlEIcyz4ZadM2b043zX7lQdD
X-Received: by 2002:a05:6122:30e6:b0:5c9:54c6:b4c6 with SMTP id 71dfb90a1353d-5c9b58ecf23mr663818e0c.2.1789715775923;
        Fri, 18 Sep 2026 00:16:15 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9b81eecd5sm788205e0c.2.2026.09.18.00.16.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:16:15 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564319a92so105134137.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:16:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEno3qFQf0fxE7W+jyf6sisl63W+1fh3pZXvepW03zpqW0ToK5WbLbapT9fjRBuAw5JDfbHLKxVXxQAZk=@vger.kernel.org
X-Received: by 2002:a05:6102:54a4:b0:790:fd7:cf36 with SMTP id
 ada2fe7eead31-7a55b94efeamr554171137.11.1789715775067; Fri, 18 Sep 2026
 00:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a7f69e8d-1140-44b5-baf8-bacb8c30c01a@kernel.org>
In-Reply-To: <a7f69e8d-1140-44b5-baf8-bacb8c30c01a@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:16:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXASe0VkAwaKedwA_4R3y9ob+n61JBVYODOEves62K_Fw@mail.gmail.com>
X-Gm-Features: AcwNN1WvhK3fTlIFBM3xM76KqQ_q75nJQb86r9gVZkwCkG2xgXVRLjSNKLjz2rc
Message-ID: <CAMuHMdXASe0VkAwaKedwA_4R3y9ob+n61JBVYODOEves62K_Fw@mail.gmail.com>
Subject: Re: 2026 LF Technical Advisory Board election - call for candidates
To: David Hildenbrand <david@kernel.org>
Cc: tab-elections@lists.linux.dev, tech-board-discuss@lists.linux.dev, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Thu, 17 Sept 2026 at 20:53, David Hildenbrand <david@kernel.org> wrote:
> The 2026 election for membership on the Linux Foundation Technical
> Advisory Board (TAB) will be held electronically after the 2026 Linux
> Plumbers Conference, from October 8 to 15.  This announcement covers
> both the call for candidates and the details of voting in this election.

Thank you!

> The public minutes from TAB meetings can be found in this repository:
>
>     https://git.kernel.org/pub/scm/docs/tab/tab.git/

No minutes since last election?
Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
