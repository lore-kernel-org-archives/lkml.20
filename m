Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE623B813D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790544363; cv=pass; b=TLg4Sgz0xcaGuE/M6H8t6ZSa+YHQveVKwCrhcloSL/CDvoQ7fDe+gK/lVIKWDqjXPPBIAtTXYg9wmcFkw1xfK+lI9DAgp1F7b+rmTx3stWuomvpvUQehi2ysY/nFHpPlynP4YSDSrrAgNrD43AkAx17XesfF9A7H/LoDlfuGmZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790544363; c=relaxed/simple;
	bh=OyV5qzOI5Wnnh6EHmB81OBgeAGzOyLQLRQtk4fN0xoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFhzYjno3wc77alWCzgFE37rvQDJrOteq+hZ3lepp/jMetljDFg2gHFDZIimjP07wJLi3fg5WblEqAF0gNX8J+qFwckN1QBNuBhtuxI7ceaBfQAaA2EHrl9+jOWV3ys18lsS+R7Q5UfNtU+zixNhY//JDIh9j88Zw23PxXFIrEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY9voiOW; arc=pass smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY9voiOW"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac62c88c7cso1375392a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790544360; cv=none;
        d=google.com; s=arc-20260327;
        b=pFOA5oJGJafsoQQOrIv4VEKJZVoOvRZxK2qJuYGT5533Lw1Cz74vRu7IXwztk+BmLO
         RFT3yINJQxqYtAK5YVF0zlObrZd95T57E/elvw99eOjV2VsDPvfi83zhCUHRwuFYKy6f
         3kUJ+V7Mv7DkAE1NT20vRIU/9g0TQgijFdZp9RB9O489/ilrNmJKDQ4bxbb9TDeHIEXd
         why/qCHbGr6Z51riEUcprVjoQewFezcnEx1im5gQSe4pyHFDcF64fjckYrBgn73Wv1NC
         98FEwEVlGpXIrk8dEvMYVB8Y5UMLeNrI+4S78OwGKHhHLNBC4Q/EhQ8B3cM40mJB6jZc
         ickg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=afx6rs3MUp7cbF13CA+ODxBNiOALqRqQFIDJ9EhzSts=;
        fh=JP38PRNsbGzkGUj9IzOe0L6FgMinlFE7YZP8w/wCyq0=;
        b=pwgMQqKeb8n92a8DInEkZa1qLyD9dLpaiQqN5XeBBIoPzRlQgrKFqaMGUBk+kH0Hrj
         tiS6X18EvDlHo2mloxBWP4VQR1yuKHvF9LKhX8M508b1CrfwoUhreiH2ZIZkCgqSvohN
         WXpe0qck75piwsonSeZzjOQ5SmSTbLf0aRv2jQTImBdBeYMclwJ5C4sP2Uh8g8NrzUYE
         SJCGAIdUiGrQRFUvqU/MSe7V5qxlqrd59s5wqu+7omcqWQ0fWyYaDUz8KtkfKrsaNYag
         q2Wm7YFkuUlataHLVFCD6m0cwytNTFJryOy2ig8UFA4t/ZaLM3Pr657VGhWXL3X+eKhy
         HHQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790544360; x=1791149160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=afx6rs3MUp7cbF13CA+ODxBNiOALqRqQFIDJ9EhzSts=;
        b=EY9voiOW7q8/CSGhvbV9BmRABSJK9PMj/Uoka2WzQTQCJSE9aIcxIVTyTuJBcbCNR+
         eWZISKjZLqjE81Lnru4vaaK0KtU+MpE6amO6dBWVrJvHepGv4I/bZRuv9aBpJw8/XbEN
         y0B0abEjsSwWusMkQli6vSIQ5nrc6be+h2cjSjyDSd0gVPHHmfk7ebLG4OYhrHH9vnRI
         9hTebdPXBd9DsLkoLLOCoJQPDbuheJEhCskeDVGnIGLVbnqTDxa0kaRTnBG7YD61UDfW
         qpksxrfheFjAd+HtSLx+jeAeG0ZSLSzZ7Nn1GqniMym5vYK22gSLhfgPc7d7yyLNLbHf
         vjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790544360; x=1791149160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afx6rs3MUp7cbF13CA+ODxBNiOALqRqQFIDJ9EhzSts=;
        b=MLHERO1QVr9xyc7MulvpG+kZXc/nU6RVUAtlznR/Ov72ywrpTEfcCT6U9Loe99Vvd9
         Zp92UN5tsvXThVdCW+/m7glf5tQm/5F8H3hAoOY6edghyI8bOX6VpJ6AmITpWMLde2ff
         N6qkJzozoyxV0fwgtvcwmjXLXUQRWhGKaTcPDiT8mSsw9lpDjkIJL0uPu90Z/QW6Sis4
         QYU1Qbpxs+F4VxQGwdl5QQn0IxI+bHDQxxD18ZPOsHi0F1s5/1qQ9utrUui0XikMs4/P
         J+gjlLLjgxbkRukUxNM32wespwr8JHrYpG564DKcU7z9DRwkqj1x1qzXbIRgPxuK9QFx
         VQiA==
X-Forwarded-Encrypted: i=1; AKwUvBxGEdqg7uai/krTibKdpvblwOMnSr/v64KfzLOqXlSwB1shE67SAaUYBJyJqRyTEkSyFd1YKA70EEs2YFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr0xOeOHU+36bb7n+yL0Byv9GATHs0jMz3FL4yvkrN/57dWkzB
	dE60vModvCLl9olgJnSjBNAO5ivjihLg9Yf1Hp5GrnvvUAWPnkF7F0EU9TJW/EpvaQQFSBq1dbO
	tcWkWixbYooLmGpFoMZa2J99SzxKjT4PdbX9w
X-Gm-Gg: AYBFou3kUX199k40I4imb1+4OAAsREYjLQdm53od81gub0Gy0QXJMBGMqLWYBCtT/ZR
	Il1S7xlCP2qQjMsjtlLh6X2P3u5THQa3T5sOOLBxnDX42ngdrkRYwq+BeenREyPcyhaoSm6os7l
	SBb+MeP5U7410w2x44ie33jRJoTBdzppU9CB9I1iFxqqODTNetaySWifXqNnvyVFPfIwqg4g7IY
	gEKQFBgQDWWu/Bk3JhaNHY1qxG1R6umDlqx41GmbaXsnPii2y+ZteTiGFvkRSVS3rbcDjtZFWtG
	BYXHrFAPIw7s/24ICQSRdXokaxisaumgzEgJ85QXX09SeycUdYPo3dPXHWIh0VdWdqby8OWx6U3
	M1Glz9VFkxZ85g2Eij/UXxx2adJSBco9YVq0h698VMA==
X-Received: by 2002:a05:6402:901:b0:6aa:f260:b851 with SMTP id
 4fb4d7f45d1cf-6aaf260b9b8mr3902937a12.33.1790544359978; Sun, 27 Sep 2026
 14:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927005821.8369-1-kaloz@kernel.org> <20260927005821.8369-4-kaloz@kernel.org>
In-Reply-To: <20260927005821.8369-4-kaloz@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 27 Sep 2026 23:25:48 +0200
X-Gm-Features: AclHuK_Xr-YU9xa7Qsr97sxtxNSM-8bhp3vLKoV0Yof9ImrfSJtY4G6awdb5GmE
Message-ID: <CA+=Fv5Qu=X0Gc=50UN37ijW7oZ35X-ASEmCWPSppkWZKUZ++Ww@mail.gmail.com>
Subject: Re: [PATCH 3/3] sparc32: emulate integer divide taken as illegal_instruction
To: Imre Kaloz <kaloz@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Imre,

Great to see some activity on sparc32, thanks for taking the time to do thi=
s.

On Sun, Sep 27, 2026 at 2:59=E2=80=AFAM Imre Kaloz <kaloz@kernel.org> wrote=
:
>
> SuperSPARC and SuperSPARC-II implement a 52-bit by 32-bit integer divide
> and raise illegal_instruction for udiv and sdiv when the 64-bit dividend
> {Y, rs1} has significant bits above bit 51, as the SuperSPARC II
> Addendum documents, so whether a divide traps depends on its operands.
> gcc emits udiv under -mcpu=3Dv8, including in libgcc's __udivdi3, so
> 64-bit division in user code on these CPUs dies with SIGILL.
>
> Complete udiv and sdiv, and their -cc forms, from
> do_illegal_instruction(), sharing the windowed-operand helpers with the
> casa emulation. A CPU that executes the instruction never reaches the
> handler, nor does a kernel-mode illegal instruction. A fault reading a
> windowed operand raises SIGSEGV, as the casa emulation does. On overflow
> the quotient saturates to 0xffffffff for udiv and to 0x7fffffff or
> 0x80000000 for sdiv, and the -cc forms set V, as the architecture
> specifies.
>
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>

I stumbled upon the same issue trying to boot Linux on my SPARCstation, and
posted a fix for it on the 24th, same diagnosis, same saturating quotient a=
nd
condition-code handling, same window-flush-then-fetch structure:

  https://lore.kernel.org/sparclinux/20260924205646.870950-1-linmag7@gmail.=
com/

Yours factors the windowed-operand helpers into div_emu_32.c so the casa
emulation can share them; mine keeps it in traps_32.c. Either does the job,=
 so
I'll leave it to the maintainers which they'd rather take.

Regards

Magnus
