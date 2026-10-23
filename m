Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792743781;
	b=rkfWMT37UaFW9bnhMlo+ys4Jsu5L6WyNZM0O8cohujnAaqrJHzBaTLo6G4OSnZHdwFTn
	 ep+CsekrzJS8A+6q0vRolMrI4ehremILqPrnExKMSGCJW6zsHzyvx8aRvuJICKF1GvJ5o
	 cRTqS46win0kFWQVbn3SxVMvfRN3TiS+8CBC6ZKx6TPIpVO/IFaRRV0PvXLQKNIq5IX4/
	 5OTPCG8JTp/CQ08u2C8fAxGLZZ4IsYU0n6V4JHl9hDWFWq5Utw95aEiaMHB9AVNE7igkP
	 X4TrSnvpsAnNsxfMmCccim3rHd+lWrfJzCsu0NrR7E1KyiPGskrjFv2bOO6ehM1lAdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CnID61DBqXYExMRhfWZPF2Tk54RL2V7LncDliM0Ny80=;
	b=zsUiXz9vGIof1JmQHEs3+jxWWPZi+gcFFszYLPrAhy0wVPTzFuZ/A2UosMqR/8m2MG0j
	 i7MLFzDVAb3si5rzkfYdW7LuTJ10Raw/FhH2Rt6f3hNOw4DgGa554zW2fIZOVuJcNg5SQ
	 euOgqIMJCBQ2+5zDS8IvSLvqeiH7GAMnESGGqR1IAcZuo+2voCkeJ+Am0uFN0MoyxD7qa
	 yEUhEZWLJTI0/Z6sDcfnR44kpNBsehsxF1F1qcVlF2Ue+GAInAXdCiQwxNK6TBFOe6quY
	 0Gh3/UHk/IBp/e2SbX7rHLlSn8n8Zny7RFSKgbisrYJb0IlBu5ANgxhiy8cY27vgQiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pBThlLg9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED2606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8ED2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pBThlLg9
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso238833e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792743779; cv=none;
        d=google.com; s=arc-20260327;
        b=L6youuhl8Jsbe41hO3Pk0dnxGcHMhI78mbW6I05YUBiTmI27BQO3mPHYrxwofqp93J
         DvtBNsOMmec2M5v7n/N4dNrBkMQEOGDJsTozNQtcVGehNDU/R1lanCs7R88/Htg2mJEa
         bDb1ekC+DbATrjOK2UmCyksoLVTcuxX8d+raLgiP6ySzHo1abUhh/6Ha0yCv7FYvuiYM
         0ATfNekWtNibwPFOnoVY+O+Y3tr/Q3DACQxTryQ3ldJaZ+0NeHCneVb29khAC5a+iQFw
         dkWYFJqoaJSFu0FNYwpQY0eI8wX+r9pngoYjQQsfqkFk358pr6Yv18AtU3bjQS7IRzFK
         LsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CnID61DBqXYExMRhfWZPF2Tk54RL2V7LncDliM0Ny80=;
        fh=tGykKvQ8i4E+2h1iV63gkZrj37lw6yzwzm9MNmqVV8w=;
        b=R4iin7WMXRUeqxbi9Fw3r4ihkxeYMNGOBDGvGMpdBbYoXqFpYhjpLur6d7m2ZSvhPs
         YcNepm0S7NoojAG6kbhHvjb/pnUCWNCUcQBFngPzFPqjCDAXrxFfP4A92f10uWuS6w6h
         NA/l5kAA+U6OGDlFQEBRRbOGy/x6V1RKRKGvkB9dxFF/cXa+gQBaPAy/t8dIsIZkT35c
         vjF42j9WfZsLTthOWaL27R6bW+77VU23VBKQ7Sxq7bifrXPhOFVanIl0lLpx9Xu1Pc+S
         N0JkbEEg5dMyANrCBV7vRCD6mE1zvaDsXo5JPz6lr7KYpRxacSfDOP2Ng4g0k+mQynGF
         Ts7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792743779; x=1793348579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CnID61DBqXYExMRhfWZPF2Tk54RL2V7LncDliM0Ny80=;
        b=pBThlLg9Wjoc1dNzzQ2MNkvpXXZwwfgqFXg8OaxUDOg9A4KNOFTNmM89O1J9PtW+UH
         6nemQHby/5344u4cN6Dt/dqw0Ht5fE2+OXmur7xj9vfgmp2j0GxFwUWrnSC8aMFk2/jX
         ulprL88lYSE9g5mEt5OuqFl18Hx2T1bzdXzr1/BjnsCml7oc8bNdyNhK6Fl12tWYUQJw
         zBRjmi1vuc+yMJItrFAV9R8V6plwWAW9faLqHxCCGf5PRe4bW/+A3w61FSuOD5yBht9M
         IHrtIDs3dgw4BOUpoLKwD5kB7hcUnmlpjRsJw4SwcY0u0zjxZRZy2J09v6luAPKWFYUj
         XPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743779; x=1793348579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnID61DBqXYExMRhfWZPF2Tk54RL2V7LncDliM0Ny80=;
        b=K8KVb7kAgzAid9QIgTuL8YGlJQTRoJEJbOs6LpmoKkrSPQIZ1+2qWBXJDWvIjf3ijs
         7zAD6PObDi3Hr1GkZvHI8qw6gvQOyjX0aOnNbhSCyE/dC1YuqizEUQ9ibSyz8+qLMXk4
         RNQHQVT2kT+VjPSarGeKkq4IiR34+lm+caECn35QhGR+jdBpsO8oAuNrE/Ff2DBW490V
         raucR839TS8CG1Q64jydai3ra0TbC6JHA+dK+WITIIAzHtXnHQ0QnlsmysVaIlxPIBcZ
         OxcbM63BvsbrR6ZCUyQw0WPwcGBKG0+nJ3J+5BLNMStWA3NWqwmaLMwpM+hjSuzosWpO
         Fkxg==
X-Forwarded-Encrypted: i=1; AKwUvBzoppmtr1OhRugFhrUXsY3uMKvSmLluG3VTQN9f1uQlrDaRRPG2RVH3mWpjxYo1uoiMaJaX6bCLLbXcr08=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcjG9dRkU0T0OzmFf12gKzY11KCepdX6B6ULio0r7/RjfoaYCO
	UkKgvnw4trP1kUbo++V0XcNPtwu+mYTf3RTNVc9I2qUZVfOkMlYH1SaXh8FQwpZ+PeuJ1ec+jFa
	0JeULiUfbz62TUJtBPFp4ENIHB8QonNI=
X-Gm-Gg: AYBFou31QWiuDMw9W4IuD+6BIs2sRv2un6UZTrQseCTxTpU6MGHOWadClLc2g+MGd7e
	gbUhqL6+9TH4+9N+kXChjyg4fSI+foaC+dVRUtnHuOwOOCUORmtPQ5gT+j251xmINbc8sj06OVF
	8Gpo4cWioTVNiZZCRngUXsAc7ccjLCqZSbr58pvbbE/UuqRIPYMtzhK5F9Q0SLZCRDHKplk41R3
	XB6m+dJV4ng6r0qsoD8UwD+RerwGOl3aOf/DTkU0egCbMxJRukwh1etcv2VWqvk9Da4ZvWBWj7U
	zEl/B1uebKz8RRsBxjhyomB2bnNXkdMKxk6PrcTrJJF42wLvsdWEetIWMjANRuJM1oTIuv3wj6+
	NMRrjEPTBc68oUMlg6N6QaQeZSGbryMDc4GO1Ui+Csakm43XTrOlToTqkQQzhrZFW4k/9/e0AO3
	WXUuGwdjvRFrj9YVBOq21+qoRIh29JDuVvsU9H31AVP1unB6gIMiQq3NNXRzGNYnzW/GF/+45ym
	ZCe6F4lD6Jke4Gh67IbSGK84LvreiTk12oSGLw=
X-Received: by 2002:a05:6122:3b85:b0:5e9:731b:84f3 with SMTP id
 71dfb90a1353d-5ec14a6c5damr433520e0c.12.1792743779585; Fri, 23 Oct 2026
 01:22:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021181626.2004489-1-edumucelli@gmail.com> <undine-1792630374135671788-0c3e675ffc202af4@undined.local>
In-Reply-To: <undine-1792630374135671788-0c3e675ffc202af4@undined.local>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Fri, 23 Oct 2026 10:22:23 +0200
X-Gm-Features: AclHuK9WpOx2XOoSeKunyY_VJs8XYXEI0-YSZhd77j30Ylj2IWLLKn7cIiX0T78
Message-ID: <CAK0NWSMH0Xn1HrP-sbHgAveF4pR8D2LaSuvTZBX+g9Pzf_UnNw@mail.gmail.com>
Subject: Re: [PATCH] tools/bootconfig: Fix enabling all events in bconf2ftrace.sh
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Masami!

On Thu, Oct 22, 2026 at 2:52=E2=80=AFAM Masami Hiramatsu <mhiramat@kernel.o=
rg> wrote:
>
> On Wed, 21 Oct 2026 20:16:26 +0200, Eduardo Mucelli Rezende Oliveira <edu=
mucelli@gmail.com> wrote:
> > A bootconfig containing ftrace.event.enable makes bconf2ftrace.sh try t=
o
> > write to events/enable/enable. The per-event loop treats the global
> > enable key as an event named "enable" in a group with the same name.
> >
> > Since events/enable is a file, this write fails. With --apply, the scri=
pt
> > exits before it reaches the code that enables all events. The same thin=
g
> > happens with ftrace.instance.NAME.event.enable.
>
> Good catch!
>
> >
> > Skip the global enable key in the per-event loop and let the existing
> > global handler write to events/enable.
>
> This looks good to me. Let me pick it too.
>
> Thanks!
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
>


--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
