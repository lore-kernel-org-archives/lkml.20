Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793099251;
	b=WfHEzNgPct9PN+O2y47GHWGV04cX3cJ4Qloy/3nRuX8BcG9+dw6o5TKf0XHVbWekCCsV
	 aITEwMxk+qzTQvqB3nxxnaQUAb61II/c+IZb8GPnVFJB2ouGPu5ZTSWCl5WrgGH6306mb
	 vSDL5//PAsoya/bZxC+NKqnKeRz3zkzQ+F+NOFHRSoFfgJBcuU7iorHrdlHAu8qA8TeUD
	 M7At0ibQkPeN86JjTi8Gj+LXmevzw9yEMs5Ah/C8uqq/6qEtPrJN516QMFvHunzgl2/IP
	 Re+DOAFSRMR6H2Jqz/TrD2YgNPCk6I62Eqh4wjDLD5avt16tI8+sgz4+vby7ev5ZPOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IxgxM40qKppYkcLvHablg0AyarVMw7TsPIYnNClTEMI=;
	b=da/mGut3opg9bdeRMpYYyJDygaQz9E+p2uM7SKqsU3anKcrwOmS6L9gE3ichN+yzMBls
	 rbS7o6YIVQz1fhEUg0AKwQczFCtlmiMXk9Yz6USdDdDGNHhB/rTTtAqaPM5KIhao8hhI7
	 fIPWfsIsjkjapECFDNtzZ0CWmLkSgwMXeinm83zbLZJDRLGZ5Uk6GD0vZuucPYhw4M63T
	 q0s1BoTKpiKji3mlitO6HdoCFge4Bnzp8i7/V54jtiKm8kQkM95NJ6/bvOwVcJMMvrWZS
	 r0cYYxyNvVmPUCceeiSXgPi+FrtxJWs5tLF2abs5IIpCNH6PYKKMLN56YlhJ6h+QTcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rafMftuQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6541F606E7FB
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6541F606E7FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rafMftuQ
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ad98c3fb15so32937787b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793099250; cv=none;
        d=google.com; s=arc-20260327;
        b=X8/p/JJ55D7nro7qz7ib8uV63T9zl31K/MpiQEfWcv22ws/44FpgXW6dWKyXT0qqTQ
         FhNoiTq8ciVukBKDhsqhAZoqAXXB1Fkr4RKyArdbsWfo8FmJhmt/42DGTa1QCA/U4Qqp
         AdXQhlwjaazt3h2U76pbSGkcKL90e2c7cEiNF30WixHGNNy7cDQd7SWuhMBwOA3jtD6O
         W3Ue/vxkXgzom5XVZHFFA/B8WdBso/v9r8yyjKXfuPRv3eEpkBy/SUFOvxUIHblbn/3r
         IC/HFYeyk0U+JexXhFr/xidrB/BCWauow6yQMVEUNhlowSIDATybM0QGEJlNzcbRI5Em
         3wpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IxgxM40qKppYkcLvHablg0AyarVMw7TsPIYnNClTEMI=;
        fh=FScu5Oh4kbocHbT+hQlzcjkyvjltdn6kvQeQECPzcmY=;
        b=Mq1LqXcCMGbXU8o7P+bSPvvZmM678t4JFDBp2Zqg96kJV4Cx6CgKGICO8I+giZ5ein
         FJW2gNR0NdzUhe3NvVujtcam62LQ4K809sbtbWhTTdaVFJnimHGqH7K346rwUAb75rqy
         LIcQ6yfHLTfpb8XR2wFH1vy0BpCxEOw+R4JBnuJagUEpRoULq8OMufkActe4Pu8fOLGs
         Y5QL+/vR9pFMi7MYm7HDmykiJ/WvC6LA24votp9jUQNMxkdYqr8sjZzAiuwWSA+paqRc
         dPINXXGS+kbxHN90MbI0Rme2Q9F50n+bti33azzxwzJgW6dUwEzxPJ0YdtrPjlCPlUYA
         eM6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793099250; x=1793704050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IxgxM40qKppYkcLvHablg0AyarVMw7TsPIYnNClTEMI=;
        b=rafMftuQv37CSy2M2Z/LH0hT/6DD0vGHUViVQ6T/2pBqq0vwGrX2YGcRoIcmcOv4s6
         SMcJucaaNjmzzPrXps1BoaeD8Cl6C9H2GHiJCPeyGCtwNwb88BNppyXDjselR1KNPCku
         8F35G64svydgJL8Y/oG0I0Ucgn2ku0SfagELKzWrvQtZM/dVV8oUvSypYn96tZr2V5V/
         3TljiEX37a9dMSR/+QJ/osJ3pzIq0OE7Aa4U8yEdUP4KFEDbACZ1edh8+h7BRtQcV5Yi
         NA3T3nYJOW1nd74KFGe7Iq5HRuo3ehWFKE73CRZdFIFfna9/Oz/9q2rknT61GvRgoycl
         +dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099250; x=1793704050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxgxM40qKppYkcLvHablg0AyarVMw7TsPIYnNClTEMI=;
        b=hS0gdkfwxtn/vZrdIZ45vkjbXsKT9WDqrt2KIv5kZiC8uMRbxUSW2lZJGckrTB8CXP
         aP4TZgthO48Dob02839pT56a3pMe0Bfz8O1CPu6JxeX2a48kYkYtHKy+CKKAlb7LnNiq
         evJ8H9hMuJRF5/9uV9pe0pxt2coFvuE8tNgEylxKRY1KAtFeCmITd3NJf5Jtyhj7rEZL
         N1JH+qUhdYX2njRGc/fd3vBYAiNco/MvSUAmIyS2jK20SVEphvDlTguMky5slCEzUbiF
         6O0BJ+3FreQPpdP1VQITqPDYzb5m6qWvLHscp1JwM2K8A+hZ6caFm0P/zW8QMWUekgPL
         kGEA==
X-Forwarded-Encrypted: i=1; AKwUvBzPUeZ6tEXLLZ6h5vOI6nyDcQV0q8IBDCjZcctsTtv6gj5huJkEsO4uxMJqRabZswoRzrv8Vi5InDkxJb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYId0mHpgh6nQPN8BQNNLBmqBVB3C+fJsit8AyJpFcQ5s6MbQW6p
	5wEysZwoaVfh2TGiL+E5FE1RPvzSwIsCPveJBjcpWsp5c1h3QqCpdWYdit/HrbKxxTeSvZk1pV/
	o8alMHX33VXZDemA9zpG9ulExb5d9L9U=
X-Gm-Gg: AYBFou11rr0M/1fZ7PQEtTFHGKQinKNofOoumGXnPMbTLkSH2gTZJLv0WDNC6CKWTaA
	MXzJhhxFg3FSSaSt0J5mJwHz+gzXtnve5VXHwRiSw8rL2YFXk2QAjHSxmVhnfDGZqw8h/i8Skvt
	9HLCKLo8l6qIdV9wFPFKHReLb1eNxbaQBbQAeYOsDsPUEc7s4VK9Pj3JcdGkC0uaUeSh16/7hLR
	fHLRz/sa7rt01mFNtUlsk5BX9tdXuLJznIT9pNwUMDaHcIIsMwff2rgVn64Uoy1vjWiXugVfbas
	EAgoluifmc3bL01kwnWA10fpaGK/AitfCpS6iVaDSIbZWJ4xPJvdQgc1L6ucdj6L6WaVMtAwfAr
	/hZKiGJu4+ZL0fQI1wkmpXch9IC6yzxn6GTA8GB/jUOQgbFRyQCY23qzcJbHSW2Y68DbhOw==
X-Received: by 2002:a05:690c:89:b0:8b0:e13c:2854 with SMTP id
 00721157ae682-8b1669e55a4mr81209407b3.5.1793099249996; Tue, 27 Oct 2026
 04:07:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-ipe-keyring-rfc-v1-0-156f0b93e843@nvidia.com>
 <20261019-b4-ipe-keyring-rfc-v1-1-156f0b93e843@nvidia.com>
 <702ade20-a2f3-4919-97e6-c72faa89399a@kernel.org> <20261021-groll-donnerstag-erfuhren-ce34a0ed4e97@brauner>
 <CAHC9VhTHUU0h9k74CMT6wYhMwyY3YhbSSFwJoDTvoFRyTFVZwg@mail.gmail.com>
 <20261022-hausbank-dozent-hurtig-9443f3777475@brauner> <CAHC9VhQ4sdCRvJ+YPZoiQzR_hgQN6-=84qvnTDDGPf=7=L9-jA@mail.gmail.com>
 <5143896100674c9fd744c4d7d6ce12232910e789.camel@gmail.com>
In-Reply-To: <5143896100674c9fd744c4d7d6ce12232910e789.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Tue, 27 Oct 2026 11:07:17 +0000
X-Gm-Features: AclHuK-M6AykdLUZqQa3ChCCBvY0LYTQ7GR53YsAPnqddFlyo8iJeyhlphI-4Do
Message-ID: <CAMw=ZnR54hMBwGTps23t9Mm_VO1bAvmeX8uTf_VJ0rJsFNMLuw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] ipe: add the .ipe policy keyring
To: Paul Moore <paul@paul-moore.com>, Christian Brauner <brauner@kernel.org>
Cc: Fan Wu <wufan@kernel.org>, Manuel Huber <manuelh@nvidia.com>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Andrew Halaney <andrew@amutable.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 at 12:57, <luca.boccassi@gmail.com> wrote:
>
> On Thu, 2026-10-22 at 13:18 -0400, Paul Moore wrote:
> > On Thu, Oct 22, 2026 at 6:19=E2=80=AFAM Christian Brauner
> > <brauner@kernel.org> wrote:
> > > On Wed, Oct 21, 2026 at 12:51:35PM -0400, Paul Moore wrote:
> > >
> >
> > ...
> >
> > >
> > > > Of course, fitting in with existing norms is important,
> > > > but if it causes IPE or existing IPE uses a lot of pain, that can
> > > > a
> > > > good reason to diverge from those solutions.
> > >
> > > Which pain?
> >
> > As I said before, (emphasis now added for claification) "... *if* it
> > causes IPE or existing IPE uses a lot of pain ...".  I intentionally
> > did not make a claim either way.  Once again, I wanted to provide Fan
> > some support in case there was an issue and he found himself in a
> > position where he had to push back to preserve IPE's model.
>
> I think there is one issue with the design pattern where keyrings are
> set up in userspace, that I have mentioned a few times already and I
> got documented in
> https://www.freedesktop.org/software/systemd/man/latest/systemd-system.co=
nf.html#RestrictFileSystemAccess=3D
> as well: they are trivially bypassable if the kernel has kexec enabled
> and it is signed. The security model relies on the "good" userspace
> running first, but if kexec is enabled, there's no guarantee that will
> be the case, and as far as I can tell it gives root trivial capability
> of overriding it and extending the trust chain as the attacker wishes.
>
> IPE specifically was designed to avoid exactly that, and ensure
> userspace could not execute untrusted code, even with root privileges.
> With this enabled by default, userspace can just load the same signed
> kernel image, passing in compromised initrd and command line, and gain
> arbitrary code execution on the host, since only the kernel binary
> itself is verified, and anything goes for the rest of the kexec
> parameters.
>
> This is of course not to say this new IPE keyring shouldn't be added.
> But perhaps it would be nicer if the default build flag was mutually
> exclusive with kexec being enabled? Not sure if that can be expressed
> in Kconfig though? default: yes-if-kexec-off, no-if-kexec-on
>
> At the very least IMHO this relationship should be documented
> explicitly in the kconfig blurb, as it seems to me it's a major footgun
> to leave laying around, and users might not necessarily be aware of it.

KHO/keyring folks, what would you think about preserving sealed
keyrings across kexec via KHO so that the chain of trust can't be
reset by userspace? Good idea/bad idea/yes send patches/no go
away/etc?
