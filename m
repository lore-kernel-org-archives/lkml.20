Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45738F636
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805838; cv=pass; b=RDOYzM4cp+Ljy/KlWC8eoLyfnFkm2+knFFLMuu2EHS4Z4DL8u812sbLYZK4d39clpuXNoPfoW+Cvl4ctbti5h4DcIqagjzODJktEkoWGvq9ki4ZkyKtMabhDF2w7tbSkLebN+4QsNq52bHw+ARxdw4E6lsryOk4/P+6RB9VBMpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805838; c=relaxed/simple;
	bh=z6VPGWCw7rEpPhw2SbJhvUKlG9shXTh5n37bEXti6gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXdg5Hx2UhPr0Fs1F2YgrcrvFaaBLA+jTVKmYfCdidquBG5ScE08ktxlBi2rAns+HAt4nf3q/5Pw9b4rjANynK7syEwb81Jgsm765bwaMlSiHvYmcd/DigXLM3LhleN04McnyxPO2U3aPXixGpm8yuJ2FePvyb7rgujnqdPNLKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM60DY00; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM60DY00"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a20f56876eso4206131fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787805834; cv=none;
        d=google.com; s=arc-20260327;
        b=Ioewkl9jbbQdzWQ5KcuXxxKCgP08P8PT1r03fwtI7DmiQE89ZMKwUEF0xOQGj1B+3N
         QrWbINq8KwA8C3+OroRzDGvGFytJl3AR0f9Efj+gRqVtPJtn6OfsE0dYqWI0yiAC9usI
         KxMYSteZn7SVbjfKAsKbM2nWXre9MQlsqxNRd35apGfmGLd6JLScrPXJCDQNhPF+k4fm
         +oOgpHAxqExYXSuN/RGFUUP8gzhGAlWzCYF1mnMoEfTyFYtUn+GmJPNTJ7uIeCS25SrE
         T6vNLiAiz8Xhtcc1Qhbkd5QSfqtDSptOJBDTa935XOaWJbKg7QYfE0V0gN7g22WWj34F
         dEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhdZH4AQDOVKeQXrpMPQL9ICLmV8N8waJC5TxsBA0M8=;
        fh=XCEnuGQsjz/CGzZaCdNETiJ/vlJ3k+SZELoPDdpiqQI=;
        b=MdB0iKxXuE7pR1hPW1OyEk/mknAliAnWXdM6sMjJHgka1leOuEf0+qeiq3+wS91xXM
         b17ntk17M9lYB0hbXeI4b9ex8yZrcp9BME8+KGHBf63aGHuKUaTJK2yNkL6SyznwwjgT
         OgWD1/SOTBkEUOgxV6A1yvWqyZJpHL1eUkKB7r+T4tAhjAebaMIxh25vJT0CLYfL5Ni0
         Kt8Q+3Pe4CdWoiP6ZnlyLv6yaino4PfFXV23Ohzsd1o1OxwOvSYdpOoA2YMejdtGE8dc
         2ilkjQYhnrsDhCnBQdjR2Qve7cHi7L7XZtj3mX7hCtZhGPf5i3hdltiA3jAU9S25Dwvh
         osLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805834; x=1788410634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nhdZH4AQDOVKeQXrpMPQL9ICLmV8N8waJC5TxsBA0M8=;
        b=EM60DY00o2WgRQsHGmTOqdgJhTo+gu6M72aIm4YHXBE6s4oOfbCI5owrqMw/HCRHsn
         +nmPjXjolj7NSlRfev+DnUzLlYnPK5+QVHmZp/K6Dv2Zfl+CcLSPorU75Ljo6F7/ro6D
         P152R7scIHwrTK/U9TkIg+QPNHfv4hgXi2itkPtuVwqffxj45ydHQ9R4UZRy5fV6Nf3s
         2KGIbBWWHF4KS7pPvEv6XJaLGz4j84YAlOy5mSlFWrBmur3LU1GijmzDiSOd1fPdcVan
         J+tAWsdrq368+TbrQEXN1a92BLV+liOTHXrPfmOFKxIBOcDdKHEsbWfY9YoNDr+Ke+vr
         C5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805834; x=1788410634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhdZH4AQDOVKeQXrpMPQL9ICLmV8N8waJC5TxsBA0M8=;
        b=eU3ym3uz9dwDdt7LZO3uNXIldpycXfa1zqgAzfC/iTD/DBF88OgFNjgbkMrd8J7Cvn
         Sc7JMboW0FnjP3sI/INOBoEAGGMviiwp4zuaEVq6/CaO7C9Vykv+TjHkpqxFviiDmzpI
         XU9yU7wUextpsFGgelHSNWxYa4FRgxvNrSNGD7WpdyOUELSOw8Yt7gNjEH/215a3r0eQ
         RtDFnwmsuVncEA/cKn62YczPsPuqSXB4OAKg9TWQrysv9DOezZFM5Int/jvluVKvfa3h
         3giYflHh2yQdCN1H9lvypMZM4AvNn7nruzp3zpBqlOyQC3mexOwiidRRJ6qwng4MfgQv
         kisw==
X-Forwarded-Encrypted: i=1; AHgh+RqmHx93kX7rTW6QkeWQ5Wqk/fW3t67lDeBZpIHS/XwZ7sNZ3SX9gtEZ3JBW8mC40F71ePKVy6daT0e8f9I=@vger.kernel.org
X-Gm-Message-State: AFuF++mKd1+k/UheFf7gUeQvmahGEfSsgD2v9avczgvhhknUo2y8BUYn
	DZbO4nWdl+u5tbErX+NVqD7q0tryPVvKxTbNVgrZtPpYZ5sb3l4m+WmbQ7MWMDtcnluREnON+Jo
	KAQjTa3+rKkTtem1/rHtV3661CKhbgiU=
X-Gm-Gg: AR+sD107nlisXMdfGJr3U76v3PCOPvKzXN1mYcajnkdwHr3ciuKE2m0aQjvNmcLgFmj
	UgvTAosHZWZxrXZsY4A3ZwwgXZ/qTufTCye/zU7uC95wW1Cl5sYsTNzlx9rOKCuMxYORBJP0c+U
	r3pP6kY825Bh9est51qVC3+JEL7F3Adu1wylzJiakuVDP2XR7XFczQCKjRyQpNRNTAXkIVvaml6
	paW8r54wcUtQHrV4JSAv0R+RYqAuJc0/ylohIPCbfyJRgIbmdysXZSj3QSPIsUfr6MnF8rhxvVy
	ofzq4bh8mLhTqHgj82BLoIZ7d9hsaO0TV1V7mOtveZjTJCqNZfR++u0=
X-Received: by 2002:a2e:b8ca:0:b0:39c:9dbf:f7b3 with SMTP id
 38308e7fff4ca-3a1fd111a4fmr26214041fa.0.1787805834275; Wed, 26 Aug 2026
 21:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827031647.1605970-1-zenghongling@kylinos.cn>
 <bd197da8-a8ec-40ad-a50d-dc579840d680@163.com> <6A8FB73D.30104@126.com> <6bf63800-e169-4ff7-baa2-52c4d42bb35e@163.com>
In-Reply-To: <6bf63800-e169-4ff7-baa2-52c4d42bb35e@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 27 Aug 2026 13:43:42 +0900
X-Gm-Features: AcwNN1Xdgma1ZvWQvIA8ZJD3CihsJ2geawtIGSe3EcuUDM2iz2mdfYi8kHS-uLg
Message-ID: <CANFS6bYc88BcJFgQegg84DpDN4MHewowomCRAvL+2SxAO4L9aQ@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: fix race between fallocate and mmap reads
To: liubaolin <liubaolin12138@163.com>
Cc: Hongling Zeng <zhongling0719@126.com>, Hongling Zeng <zenghongling@kylinos.cn>, 
	linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > Hi  Baolin and Hyunchul
> >   You're right =E2=80=94 that's exactly the unbalanced-unlock path we s=
potted while
> >    preparing v3, and option 2 is what v3 implements. The early exit now
> > does
> >    inode_unlock() + direct return, so every path reaching out: holds
> >    invalidate_lock, which let us drop map_locked entirely:
> >
> >     inode_lock(vi);
> >     if (NInoCompressed(...) ) {
> >             inode_unlock(vi);
> >             return -EOPNOTSUPP;
> >     }
> >     inode_dio_wait(vi);
> >     filemap_invalidate_lock(vi->i_mapping);
> >     ...
> >     out:
> >             filemap_invalidate_unlock(vi->i_mapping);
> >     v3 with this cleanup is on its way / attached.
> >
> >   Would this v3 approach be OK with you?
> >
> >     Thanks,
> >     Hongling
>
> Hi Hyunchul,
>     I think this approach is good.Looking forward to your feedback.

The approach looks fine to me as well.

>
> Thanks,
> Baolin.
>
>


--=20
Thanks,
Hyunchul
