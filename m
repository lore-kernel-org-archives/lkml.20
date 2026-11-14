Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676291;
	b=VF65484NV/Sbt1tv8zJIkwK4s5pDcpbYLZMfBh4ZnBrNWDRYLL8zZX3FOaEI3yRaSeDP
	 Xwy0o5QDLrwaQ/QdmMV6ygWfEZ7CvuDBlLOQqEbadp52BRcX3fwlLyeoqfInt4zuJrHj6
	 D46Mnw3Sc3xHKrvCxp5VsEpHoHBix8lwGfBWAlH+pSgCRbJaEwksZGJB8wcs7TyuaInH5
	 WQzFjcnVdo6XVFPq0KpUfo0u0HxPQbLNrw93ETZTqYGcCMYpOLzxOi0o2JuHCKxRFWdvP
	 /5YQj0fZAd5t8ex6gBFG4kZ3/xzjM+VuEOefgpxKzTCn+mo+GMDLZaC9U5/b7KedbNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSOfGERFH4pEDKWamyJaLP62gyGxpA0Ka4pqh6Z9BNk=;
	b=E5J/shvsjVOEOYMtwTY3qVXyTIfjsOkEt4VuhJDa8MULD3QetvXaThxepzRv54anc2Bp
	 AjgR2+DJC7hd/3FyeTPPmnie7h9cmhGbkgtWEQkPlaeKdIHCca1V/oMOJLJ4plKo/5Ttl
	 1vJ5L/RmWj27LD1itVkkT/2vcqf4mJoBP1IXwHCyIhqcgChS+SG1NhGKeRfn100Nl3oJU
	 3fEBv9EpFsjDV5Q4BxiKOR5WnDK74+pfypOhVd8YLqEK0fa/+eDpPHmW6FYwsrIqYjeB5
	 hUttECsobTL+WGdQm9yVR3DCCUcjwAL5e4W8JUw8+MNtguQjb0n6SPJoV4FlMQQ48iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHfKscxP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4C606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B4C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHfKscxP
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67bf3c6654fso2119122d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676290; cv=none;
        d=google.com; s=arc-20260327;
        b=dFkowtTDncpz+Q3HzPnhTJgw+Vd0l53nvnk9PMR6UQD+VKCMZiaEx2PR8M6N3Dk8ge
         fZNOODSxr5dGbywX8WsMeFcbystP4aapjtsL6U0/ZE5omMn7J74kHbBX87j7l0a1NPJM
         Tced2esrk16SKN3oznTakW1kuaipKAuOg4K/6xpKIYU6+jkF++A/IR5qbmH+3EtVnBk9
         caLfrlOjn6orXtXg3u+btCGcg003R/jdFpm3soUqcuwPLeA8LEKB2RNhvUbBUi/hC5NX
         WIGUyGtrbdnaOkO2h7wa3Xbn8cstW0Oeo3dWrfCe6AvR1DlYW3MaYJUFZtn+cGzIqlAT
         zurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSOfGERFH4pEDKWamyJaLP62gyGxpA0Ka4pqh6Z9BNk=;
        fh=PUZajKkIiQ9oO3bNwjGsIEN5ncnJUkk9GmjgyJlDlPA=;
        b=DF2k33lqrh0gVfb9GI6RRJfDvqgkR9NH6au+uxT2Kw7ycWFfDCgAH9eZJU8XwxC7s3
         Y7HvKxD9b+SYZLBwt0mCeo6utqIwnPpMmvES6Dt+Nr856XjzZ2slPc+BfXyBX5vUFVEo
         A9Ql1MqIgJ33ZYR4hlN1LiMZCMZtDWbxJEQvPiFwS0TM7G+rGi3kNGoA5i4ZEA6JssU0
         CS5oHVq1SnZZ0Oe3RlhzPX66LUa2qT/drC4xy9pKEYnGxEyYy6duAkwNyUymhbEE5O5P
         +qXR6IGwiEaFZzXUUaXVQm85KjqB015qwKVQTY4JtpJSOoJ7oIl/wrihbdFvEtADzeMc
         WZ0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676290; x=1795281090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSOfGERFH4pEDKWamyJaLP62gyGxpA0Ka4pqh6Z9BNk=;
        b=CHfKscxPs8539x7E4zQhLhGlVq4r46kaEqLOWYdcsgWj70uDsw7b/2JzILz/RI4N/S
         oHiMEk7jvfcsum0bDbG6dwxgnmVbouto4NJsgAm/agziM0rikFtXiA5mqimhdTfXvNLZ
         AXmdYT302MZUTW50GtBwPL7oNfuaTdfspfGa4TngY6eua0ZnrRcTg3007eT7ya3AtnbC
         5+l87GUVtmxO35Hfyh4vpo9fX0xmBmJGFWDN+qkZfZPGliNBuTyCyQxYY4jB5SMA91Wc
         fALtofyLAEKNm2LIFnd+97w7Lo1k9XP3PdOQv2uFme3N4mIrajIUwM1VqQ+PIBr03wvD
         I6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676290; x=1795281090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSOfGERFH4pEDKWamyJaLP62gyGxpA0Ka4pqh6Z9BNk=;
        b=x3etVXlV/JazNsvUkeGArb4XfiRqm/vvSNNITN1SKwGhP9VgYXILR0Gpax8jMcZtyu
         JV4fBFo8HTZ45pRXLWReC2UoTj/Sp2tvg0uJuyaJ/WEIk0QS3vY5JZYJBN9DmRd5iDA3
         Th3HgMTdgmN/VPzoh7/YKZGZfSSMBkIIC5zo3V6XDdmGzQ5Dh3rnfC0J5TuvFwhMDb3A
         eU51BTnRlO38hWw+oVGnLlCXYWeeVrobSMyi05lwjILn1SrM2EkIfMK63KC9N34JJChQ
         619Ye5qRM9qWUrAUBeXODSZuvAy0tVCP4E6Lpq1s8KWi0m80UaHRPLw3y51D/dGkEKot
         TjTw==
X-Forwarded-Encrypted: i=1; AL+hErHxlBOa7dnHsBkx77aWjhi2F5aEmBoVcsXKxVb73cjuevSN0gQVyD6ysul+KFWiv2JploLhpXL+TQwm/eA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5FLsTIEY1A6w0SMYq8iPMUOberarygbgwSBwl+tqcQyjMAzPd
	HiQ605t4vASNzcjY3v+3xLZb+3WDBT1+N7otDS93SLnZcpk8BZdutGKhwBv+I4IOGlttM1mmU+9
	KS+NMK0SMP0JS1REnSGpT5VkcO+vVPrw=
X-Gm-Gg: AYBFou33l4it5MhRpYPcc7cMdkfCFrh//BiqqWlq5yuXAVum+F/8gsBKlHHvLeUGUNE
	9ZkenpXEbL++C8Nt37eHxtzYSTDOfDx+TvlNuCGfRkGicavxW23Euv4ZGz/R+xHyRExcMEr0nu8
	sqGdlK/ZAxTtWRFk8p8DXagwKt7iHD9XdQbGxARz85SNMJUqvYkNgmUJWW49noZ6yDmprNSANmI
	/ZN+F9VOJr1lZwmTtV3aUi4XfyFWG1MTBxFOi2EL5o1CXgQiTGwxzvfN3fV2XwoGvrRj8Tk6ugV
	WY+PCsnkhqcJk7lWH8d/9b8aZkrn1qWaQVeRJSNeQZyUpNrOoAnV18kY5iXCdv7VPhJG5wS9exg
	8Fa+e7MxryMykFP9+OvDJJUh3lQlGot+HJJoPdqg=
X-Received: by 2002:a05:690e:4845:b0:674:981:a937 with SMTP id
 956f58d0204a3-67d8972f1eamr2440317d50.121.1794676290257; Sat, 14 Nov 2026
 09:11:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
 <avZ9Ku61M8z-2axF@jpoimboe> <CAKL4jwXA4OBVLFGAP4DWw6i9d5bneU=Ur=D58FnrssOt7ygm6A@mail.gmail.com>
 <avdWz3m2YJnlGgnS@jpoimboe>
In-Reply-To: <avdWz3m2YJnlGgnS@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Sun, 15 Nov 2026 01:11:19 +0800
X-Gm-Features: AclHuK8SkhxY4RW-7U4DuqAnwzbj1NmDVqMiHao8193oK5xeW2NzqHxvET-tpi0
Message-ID: <CAKL4jwXicjF4xJR0HSK7X49gUqp3df1_sGF9KBmeTKGeE_uwVw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] objtool/klp: DWARF-based cross-build symbol correlation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thanks, that makes sense, but for upstreaming I think we will need to
> take a more iterative approach, even if it ends up causing some
> intermediate patches to be obsoleted by later ones.

Agreed. I actually got into livepatch through kpatch =E2=80=94 I guess I go=
t a
bit nervous and wrote the RFCs like papers.

I'll follow up case by case within the current design. For cases
klp-build leaves unsupported for now, I think documenting the limits
would help patch authors and AI tools know what to check.

The two RFCs can stay as background on another approach, for
cross-checking and future discussion.

Longjun
