Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280F364EAF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477942; cv=pass; b=rnl5QmjnuN8TIcwftrThRxvl8rXGO60XhxGZB1Ir9W85UFtbsFK9jnHO7Cp1g1ZUKKkAJewzNsd7zelqeAhY4K/63rV3zfI8iqq7+9aMpdUhKiju2c5c+aKQrfiJNJhBQu2udJskIuqnXNT73gZ43Vh3q9XGoVsUlOn4aGV+Mik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477942; c=relaxed/simple;
	bh=9Ecw7i4IFSWAiYgf4yvpHq/WIZf2MBln7vAiGJOr+Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojaz45QXlAm1rN7FD39heRd7itFIPOukntk/EVM9K+g/+E/6xi98+uLjbLAItbV4C1REVHRlb4PixeIZlf0kfrVAjZKcJrg9muu7IpKSlMZbqEpReADPMHtbGV+wm8vjiw2k4O5iwCgRSbJYEkcqKQj01/gBN98ardsML486vKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGEz6d2D; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGEz6d2D"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66f8908a887so474355d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788477940; cv=none;
        d=google.com; s=arc-20260327;
        b=mD6y2uKRNONKVjiHk1PILy616AA9OVyuyO+NE+HPxo/+AgS7GvdrBPHb7e1YCsZBMo
         RoCTEuH5UkE0D1b3TUT0KEjV55liLb9zo8bV3wspm2E5mswCOqBjrNP0Xdzn/wksTXnT
         5ZkXxB2+nGdvVGiFapKUXcRuZhEWkN2dGokXWMXjhXT8NjIC3VzBK544j3Nh5xMi83hU
         tHnaPFr7QQwHB1AvX0R9lpERjTkAcnhIBFusOntKOn/YzbdEjkDa/0JxQRe0IDwXM6KC
         hyupZmX4OEbUCAF2BOy2YLU2ARgfLRRGmgE/C+i/737BQaYMkFjfqBhq9FCwJ7xZaeTP
         dxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Ecw7i4IFSWAiYgf4yvpHq/WIZf2MBln7vAiGJOr+Vg=;
        fh=ZFdwiv2EXqwNQUtHxfI1H6qFBYQGCTjgnb/KPnfYfgg=;
        b=WJttMW7xhw7T/4J/beVI6EhQNB63wf2EMpbhTNgyDa+uQA8+ZlBEbttBYU04Tpn2Gy
         zz2tj+7FEoc71JAzsCd/G9cftkSzwHlKq2qy0ZbHRijSmkxC+pxtpZqtuDrheyLNg9ZZ
         saCSFATFWcQO8jS329hOwqqERc8H+UNWagEzNNflvqn20jtPYveW5tHeShhuAFfd83A4
         aPlhQq4RFktz8vkvO3+VudMRDyD0g0HNfCH+bg82dCGBAZTs/5eT1bWbwW6s+kd6t9Qc
         Fz8zBUwmnq+srAnHWVOwk0ODakPnR1oCmrQS0UskdfeSPt6jldJ0MrG1WaGsQnV59oMQ
         vnjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788477940; x=1789082740; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ecw7i4IFSWAiYgf4yvpHq/WIZf2MBln7vAiGJOr+Vg=;
        b=LGEz6d2DHJDEY+uo0kBEqASQbtoihJPae2Uj0ZEgo6e41E601jmPYJi71IEhgTg+o2
         5JPhPp3/pFejwoRVNfwkQtFjS8hssoe7D3y+4+xK6oloOVOLJ3/kUyhOmX3mDSFSZKTJ
         vpSAa5pUuEAnme9Qud0H5AJQ1kPH3K35W+uw+6YuyS6zmWDwGDEYI5aF2ftPd4qonvjJ
         +uyE8O9tO7LkPb+2J1rrlq6zexmIWbzwC9nc1woiH8bPrsrdFSgU4DhMbjJ2ATmAkuxT
         CV72lG+v8XCFPzRaQD6aT4YVDQuMNKPRZJW2/ZlJRYo2PNvWrBS3pDyGgHIclIoODQIt
         /Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477940; x=1789082740;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Ecw7i4IFSWAiYgf4yvpHq/WIZf2MBln7vAiGJOr+Vg=;
        b=ndzaul1z4m7EezG3h8cvt0MrtJMY9oTPW+vorF4/fZ5AWmhIAN18kp5xYzh0WN9A4V
         W7sY3ujMHF+IlR+98JXvNcMG9hzgvYGuflrfb6IRU0eXH/TsVWpNxoY/Dkr0EfngOkG+
         Wy5Jto2Dc6OCInGf5LXDCcBAAPjv4k0kNZw+ur68muh0aGJA6gNPiSX4dL78p0WItrM3
         8b17u0FsA27eiutsoTYKNd0zstYohirtgrUnhgtxXgCOoJHS7EqIQoH8mKhEDp8OCLPQ
         UNTqKTDYRBM17q7hKpRPX00vP8Nk4pFb7h6dd4Ocv1jIZqd1qaQTzLF+FUBYtkaG3LBl
         L3Pw==
X-Forwarded-Encrypted: i=1; AKwUvByc4PZJABzGnf0qZ5pHKS0wi9nKr88AA7zSPZQisW5NWCcczzZqoQX2x5GGtbxtS1qnORNLn0kArCKGBnU=@vger.kernel.org
X-Gm-Message-State: AFuF++kXA+0eK+L7hzOL6I3kWnQWLtyVECPfEoEc+MUxwHp3GxWhg9tj
	U23nvS+nn0xdSa3lBSCjMSekjJoSZtzysyWPo1743+fYDSq1+wspLll8KRsdglVpzT+tu0M0zuB
	HaLAsKxyl+OBCOgJbYP72cBDe13R0uzNxlKLY+sA=
X-Gm-Gg: AYBFou209LEePSdMgKml07obj0wvB7x0Iagtt2CR2Lg/3u8BKcANY9/fI6oooLgdDlQ
	P2AluTAhsgFq9nmTT2fuEPUBIlM9iF6Vd+pkMj7DyQtuv3LwquEoJ2KtBDWItgCZEdjCB4hUfUo
	ou496i2cmCqBvWrbKIT4+O1uuvpc2tcxrGfy4RUrBhLxjK6ajfQesYr1Jb5gemkA1WCHBu1ryUk
	L5JoCnX6jz0535wXsNEPfcNTOK9LfhpMdrxGRicVNg2Gr1F3aWA3XDQN9x31UOycXfg4CTmVVSM
	5lz2Esu95c9QoVp/ajMo0e9AZ7+MjNk8xZxjlQ9IpSklHrJQ1+lXcDto
X-Received: by 2002:a05:690c:62c4:b0:870:96e4:6716 with SMTP id
 00721157ae682-87127b36981mr15271717b3.28.1788477940163; Thu, 03 Sep 2026
 16:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819010523.1057789-1-main.kalliope@gmail.com>
 <20260819010523.1057789-3-main.kalliope@gmail.com> <CAM1=_QTDhirxjCmXUqvPqTqXMY=uVVcPXE0H=qHH_B+7XFrnpQ@mail.gmail.com>
In-Reply-To: <CAM1=_QTDhirxjCmXUqvPqTqXMY=uVVcPXE0H=qHH_B+7XFrnpQ@mail.gmail.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Thu, 3 Sep 2026 19:25:27 -0400
X-Gm-Features: AcwNN1WPW79iTNDFIj6Mm2_tt4C65PnsaWbhuk-2wHJUQ72fLnU0kvZ9DHQ8yo0
Message-ID: <CAJZwKkj_-0vkH7nUr3=oUUZSpNSk+rsqcJW8MWnqAPxMbrO44g@mail.gmail.com>
Subject: Re: [RFC bpf-next 2/2] bpf, mips: Add support for BPF_MOVSX in the JITs
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, paulburton@kernel.org, 
	tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Fri, Aug 28, 2026 at 12:16 PM +0200, Johan Almbladh
<johan.almbladh@anyfinetworks.com> wrote:
> The MOV/MOVSX structure looks good in general. Some remarks on the
> implementation of individual emittor functions.

Thanks for the review. I incorporated the suggestions into v2: moved
clobber bookkeeping to the common emitter tails, grouped the 8- and 16-bit
cases using 32 - off, removed the middle returns, and used emit_sext() for
the MIPS64 MOVSX32 case.

I'll send v2 shortly.

Thanks,
Nicholas
