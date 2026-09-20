Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76629ACFD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789932484; cv=pass; b=mfWmzarzu9taripxYtUQ9S5FmDCPSxAEpauK2M7tWVQAFUG+zbO1Z1aqSm8sq2NdBJQM2BDua40M0LPoMlGIiJHSTFPRXmnLiPdm4c6GAoAovisHFFg9UFBdtG1oIuaDGdXGgdCWRkqm1qmSbPE4fHG/4BEMafqjz1WCJaJPFSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789932484; c=relaxed/simple;
	bh=5q6nOlmS063SvKK8pwkarrfZeEMnP1Jz3nMYjJ4gwsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWIs6S7fkQ6oGOCbwGLeFava4KFjQuBbnYF6rONw8TTVXci6t+0UTpJpg1CZsNO0rAM3pqiySMY+3m2vUUwiWkexnbgLZmhIRLPulKiZZ8W+jJz+YhgKVoSxvvL38lH19mUh3oyK+A3v46dlO2muO3MuQ/eVo1vmfIYAF5puJ7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VXeVkbwe; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VXeVkbwe"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso1958684a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789932483; cv=none;
        d=google.com; s=arc-20260327;
        b=Wpa71s6Oo8XhsEWL0Luzq3mNuglmqnOrkSmBXJfuN0bXdSZve3k4Owie5jXJx26HGX
         Vuna1jthRxKBEShDcfCDfzyoEMSDq4+V7PcdnmgH2KA3l+SdjNKj8K+qRaPb3SSLceCt
         2l5/MwXjSDyRy+rjV4hOyqt0AKeUsMeco+6R4N/Vivj486xS77EicW4+H/z3Kwa7l77A
         TpYnpU2ZDugbYW18Nd06WWSxGYPMX+AtHfV5s1GCafW7LEaepovuBobtun9iFmZUKvpA
         uI5ZqCicgER1yZnuhJKNzAl+g+Ehu5AFw0yopxEzoNKG3XLHEyDx8+DXgiYGwRPaq+CL
         P37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5q6nOlmS063SvKK8pwkarrfZeEMnP1Jz3nMYjJ4gwsQ=;
        fh=ULXW4BmjCNtbG2rOQMv73nPv3CiUlzWIUDNUdJXyr5w=;
        b=me2i84zKR7WxUPzNXeWXcr5YzZyzVdQpq/AGEzIZksUZwLFKtsGJWrXGULdGb6+hdB
         7JmbNdTNyokbyUoDhWp7lUPJ2KtHaVpECp9i32otiwUbML1wAoyop/kJNTdD178QYLC0
         NuKYcGvq6I6cH3Eo03IDvEU20h7C5oHIW6/uWn6kX9nGKoXtJRbjmpHFk0jCzFvjD3KL
         WR+pGMRkIGdIMT2H375AkriZN2serLUVHQC2DMWc1Iw93NuK7J6frSNxjLVHYh0HJLm8
         RF+suouySZNED1R6AEtoxIHxA1g3AEW8uVuDhFo4CLOq+ZdCCDAz6z+PrbB/UdraZp1n
         VQ3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789932483; x=1790537283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5q6nOlmS063SvKK8pwkarrfZeEMnP1Jz3nMYjJ4gwsQ=;
        b=VXeVkbwe79aGtyXnXWCqsikoRMO1Mr1NaeTxA6xPIHJUr56ezUn/f04CQ9SWpjgS01
         6xZ/+KgClkHDzGkcpgovrfGaPkd0J934TAjUDowAdYn7bctHH7mO2uu88JTI9A1YsyU/
         YvqoHyxODf5qln+CzHjvPFwEIRwrDCal/8Y4qq3MRI/EAmuMMub1jIP8uulgRgz7AEIi
         q09JTsE9iF7x7FZWaae5dXxKFMVudGPFpLmAgbuR6csEcTxD+PAF669sLsnxQPkrrTvl
         SPxbEWcsEzj6COVg+wic+GfACxVjH1xCvlumLmUGeVJUANJL/CTVwcadHhMnWfzDKX0/
         Oriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789932483; x=1790537283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5q6nOlmS063SvKK8pwkarrfZeEMnP1Jz3nMYjJ4gwsQ=;
        b=CKbmxGI2/5PTYvCbQjvDsp1fvN3LmJAU1qhVtS7nvJ4mW07B82fTiZnMFlz7zVxiUt
         7fH2ufTGwGyp+X6gLOAiyz6o4tFo81ZG1c9JAWQ1MwsYdSoy21KzYCiNPlau6TWnF2UV
         WZbTZLxufd/9mVsXu1T7OnJt9vLOiuP4fCcQ24e3MEuNIELIDGOS2eOFCyabABtTD+0k
         rP67fr2Nn5cXaqN59SEV2cKYW966gdrrsk6B3KEQxjZElqES40hor9BVmMEby8HV/EKo
         1Rco68O0lVnPMALKJBJFKopbqiS8rhNjZAFMLV4yoW93+fqph6XvIxIq8tt1czs3BdlK
         VHqA==
X-Forwarded-Encrypted: i=1; AKwUvBxqbczoM/rEMwi2GtEINIRzfxQkJ33WwyQ6S3beqrUKi2WOioat2ioXzzE7tXbVIIPS14OImioYPr0b1/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mpSpKdJKOZXCiv8vdo0xXpwz5e53BtG7aotNpqOv2luQwPaazn
	Ao0O5aImeakAjD2j9wMWJ3TBprN+hItlnaM3LdpVwTKOMPnmqQaLi0+0lJ7kgWLUxvHkXH2+RZV
	lHAj2TBIZyb+ILBuDUAnRwED16wg5vh2Acz8H41HC
X-Gm-Gg: AYBFou2QbvWy86nyIpMODr++WAgz5bRrsQ3I966KGpKRYScT5CrOF1nWmvLwx/qH0o4
	/Ej3zE/9NkMtUpSzyNm9qDN6pRfzzxKEsiykZgJngtAlRR8f1W/AV5PTVMJFC/5eo4IAdP23EYZ
	pagrkNJDh2fy/GHRrNtqCFeht15BgqhAlzKfYUV6P3fZ4wd0c3NiBgWCa1uR3q5Z3cvI9g3HBUg
	Pkh+3a6uC6Cr6CBAA7g1nwmgdbgYkIOCZczDUC/ZBjrL8kDxSnZ8rn8fFlJTAuWqmVUTwLDtGgt
	+472RzjaSdVj97iPhrI2YVcTLHldJMNcUMvxp9yRVgCr5Z5idvij4iCJQi71aesUv0Nz80OPoSg
	oGiIQCM9XYHIBBBCpP011sE6yCTb4c56PmHJKsYcw9HtkxSrFRLP9uG37SGNDbQ3G0tSTJ/XB6b
	fVfUT3czCGNc7a4nRJiLzr8XpS
X-Received: by 2002:a17:90b:3fcc:b0:39e:6c69:34d9 with SMTP id
 98e67ed59e1d1-39e6c693748mr8339160a91.61.1789932482399; Sun, 20 Sep 2026
 12:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919221735.3708237-1-benquike@gmail.com>
In-Reply-To: <20260919221735.3708237-1-benquike@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 20 Sep 2026 12:27:51 -0700
X-Gm-Features: AcwNN1WcTcECHeuPJqJUvpb9g7RJVrtN9kMqByZlKkqiNCviuazi6W8b0DYzOYE
Message-ID: <CAAVpQUARH-vecUojrXJWHp_C_rCpyxkB-HMBhryfxB-S76BAiw@mail.gmail.com>
Subject: Re: [PATCH] af_unix: fix u->inq_len accounting in manage_oob() and unix_stream_read_skb()
To: Hui Peng <benquike@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 3:17=E2=80=AFPM Hui Peng <benquike@gmail.com> wrote=
:
>
> When an old OOB skb is replaced and discarded in manage_oob(), or when a
> fully consumed OOB skb is skipped in unix_stream_read_skb(), the
> discarded byte count is not subtracted from u->inq_len (or is subtracted
> inconsistently), causing SIOCINQ / FIONREAD to report stale positive
> byte counts on an empty AF_UNIX stream socket. Properly account
> u->inq_len when dropping or skipping consumed OOB skbs.
>
> Fixes: 314001f0bf92 ("af_unix: Add OOB support")
> Assisted-by: LLM

Please tell your LLM not to mix different fixes into one.

btw I'm tempted to remove OOB support entirely.

---
pw-bot: cr
