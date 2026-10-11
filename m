Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448EC38E8A1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758460; cv=pass; b=S2jru1467NLHX8LWq2VjutlmNFNHg+p7F6Ssk2MvuN3Do9qtxwplp0tr5XXfdbQmq7Wloii25dQYaym/tT2KbfzYQ8Jf71J3QO6bnknoBBr6WMPceUfOAOWFkQNATeyBKhLcvn23hexrc0H7Rjf6lndGQCnJqAKDqDqVtm1QKgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758460; c=relaxed/simple;
	bh=KdlnJh/xESAqsTDKJjTzOfDVvhA5tJoAEdf6YrXiDq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkMHW+/mt+gNo+AdOYe/w3wCThcwH4QST1jd2UbnxXV2MA1EPs3Cw2k+M7SsFxES2f3oQJ2PyUSi4s8G6U8aoSbsVGay4E8TAW0XqUZjMvPYv74L08Gk1ebu89dysejIOWvowvICmC/gqruZ3qD2G6xfidDOB2PVeVy+3S6AMqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA2RrdWC; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA2RrdWC"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6d00d120b28so918495eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791758458; cv=none;
        d=google.com; s=arc-20260327;
        b=oxmoTur4Ndq1U7nnfWdbw+kh5FZCrPbWkiVeFtyjbl82A9M7TFthutlqjGXqiwi2t5
         aAnNotdBv1dZYuDWkz04CbB/ComLw3p9LsHfBlNoU0u4jR+JnxTbhLWE86FAGbnaSD6v
         puJ4yrXXqivquaWB5ZLt4RwamZG8XvPvYF5ply0KCVxdLqrsoYIwMo7Qd4oIPI1qzao2
         CStmkBw/E6BnJ+w2h2SVeFvWhQMJ94dWc4bQckvZLOGn+uKRxJ4/YgSi/xDizljFtsSZ
         f01xraT7sAoOGO6iRk26mvUmHvvzSSmMiVUuUdl5gN8tL95iivbzNT4OO8GZfcPRpsRD
         3oPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oxNUcr02s7p7Mbt+WHpYpjPHcIAcOY923VvL/15ADH8=;
        fh=EFoIm3nEwjP/AUn+cmo2e5y8Vn94cS2GtR+fhu69jn0=;
        b=emOxzgxzxMVyOX8BYH0eY5XrRP3kNLdD5PQiKP9WDPd1Mg3ARqNtcRJ3PIdfbbBLYO
         XTMNTSDrg/EPIjK7M4rW7InTilzrMtrXhc+113Gl3AsxEoYFN5ieUrQK+hkJ9DKumXaq
         TXjYTc+dVMaJxK4NFe8dWmkcGqcu4BLNRjgt3L6kspFceYbG3Mre+hdBA3+TKNdTP8xP
         47TzdW4FxlXnDxvqlqpQsVoxorcsepKLmov96c93XaP+3My++FmY5gZcW3v7rHFxrots
         EWPSrPi9OatYvzbEOeiC8uaVvign2qC2oZifUeBvhaxb9nyufV8VIVkWUAxTGt3DuINt
         jgGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791758458; x=1792363258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxNUcr02s7p7Mbt+WHpYpjPHcIAcOY923VvL/15ADH8=;
        b=iA2RrdWC/zFafdGJtYs8k5T5iSDjPS2P/zWTEbak4woUcN3mQ9fBJH4Sq6NnPLvf8W
         /s3cdwfOBg3pExeKppJPULejaa3H8+vlkqtR3Ah26yz2/D/R2nI01JKlvQ70eF6X6I0V
         1J01bP2HfOK3DWE3Sxim7RuUAj0z1+G1EuJGiI6ll56dmpR8/fIiPdmhNn7lrh0qOB9z
         QTDiiu4bu287Y9sModT5+g4jCElMyFw37wytpB1A7M50ny8y6td785eQ65OPQebJfzcO
         a04v51BYVZLJ3Hs8OLc4aV0sFN0G1RsdASzVYd1oX3geBGSbuEAmw2ksTRgQFerfkGe3
         PUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791758458; x=1792363258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxNUcr02s7p7Mbt+WHpYpjPHcIAcOY923VvL/15ADH8=;
        b=gUAOjzUpeOrjw8WcL2QM6fVO+OYh/rtq8BYSyTdK1kGRXBWC24Gep8NNCkmUdQpOgS
         pgD4skq2cmIoaMXQ2xVAe4+ODedKPIJLg48udIXOpmV0D0sI2bLBJ/DTKhm09EgLM3bS
         5r9m3XxNaR9E6iqS7CzsdbMLBOr9MWBlZbC6apgIgiKUzdX6GwhhKTQ2bmnESVq47Ue5
         rXJgz1T2oX9ZRBPsR94TcTnuEy2Y/iodeS7EHaVAJOXg0SiIhYe3YwgfsXEJE2cbNHCH
         qseZ0qsrKtvwRlR6YRZXsqrKVHuUW/cnNKi5WZaE+iGPa9Z2fzBNAjfSBpoCFtcS9bJN
         V/YA==
X-Gm-Message-State: AFq9FYK/D6UGesMpdwqnRmsTFpkj9lRg+CtU8bcGMjocPcL9a3+Br0+Z
	cmAALQLhCmlnkSTqzSSFiHJMMqzvX36KrFUwobc+1Co3dbShIqs+JBuTm+3Tw0UJHv7tWMcUZWA
	Ib9vgrQiVVJuVAFkRFZgYpBD2Cb9YrtahgAbf
X-Gm-Gg: AYBFou3cdIVvrGuTGnAPfwluPxuUaHdWtiaWU6QE0/ZTn86Sf8Svy4VhLmTQwT4SWiU
	GvhQ7P9u6U4fq0w+sqCIOxsRtAcq6r80Obcw8Ki4GIz3aBCQymj0njQ6/EsDTZtW6iYGcgU9v/O
	/2guhPGAym0dgRYnKWP5v58XpGzzXMUYULg/bPKi0jpEN9McMMytadOo+EF68jIxMxR906J8jtW
	7URGJ8lRt2Lest3QXDkz8Q9NIozWxszZdSEDZcAQ7e0ko5mfFYtQvem+WRoj9fNMW2f5QfwgsUO
	+EXA7KKJ0NSm46JhFA1G4yimUpME5Pvi+/qxCiHMQV7/tSmnmq0YBmw=
X-Received: by 2002:a05:6820:c8f:b0:6c9:80d8:a1f3 with SMTP id
 006d021491bc7-6ef0eec6e3amr5319132eaf.48.1791758458032; Sun, 11 Oct 2026
 15:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aoV3U0f9wAR7yxK2@monoceros>
In-Reply-To: <aoV3U0f9wAR7yxK2@monoceros>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 17:40:45 -0500
X-Gm-Features: AclHuK87w_WZ0NrQV271X8wnASiCGDYgaTDUcXwE-G9AUuX3nRyzsGHGvI1nK2Q
Message-ID: <CABb+yY17b5VUp9it-uv6R-oykKdVJLJ5DS73xpp4PKgFgf=7DA@mail.gmail.com>
Subject: Re: signaling txdone for synchronos mailboxes
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 5:00=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> I'm working on porting a mailbox/remoteproc driver from a vendor tree[1]
> to mainline. One thing that is unclear to me is how txdone should be
> signalled on that hardware. On that platform there is no feedback on
> how/when the remote side saw/processed the message and the local side is
> immediately ready to send the next signal.
>
This is basically a "Doorbell" controller.  grep doorbell in
drivers/mailbox/ to pick a driver for reference.

Regards,
Jassi
