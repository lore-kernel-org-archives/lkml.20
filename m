Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C15625E1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098525; cv=pass; b=HAUFQz6Fd5W0gtj6TvzNCfXwH822hIdXAYl7sYhWLd9l7o0yIBYTA6TWckOIDg8JcUqmCowm0QHndG3oPp5/cds19NhpCnc8GoDGuX6vBoQYS7PvrVYuMUygscYPDuKNTjvrZyfR2IVoOQLwyd4QC4n/nOcyYpzoIrcj0L9k1Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098525; c=relaxed/simple;
	bh=1YIIZbfM4YiwXaaCLt7e93dmE/7tvFPjqo3z+Kmpt0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvd7lNKh8fZhBEEL5xWPc0MugoY2LlVvm6Jd//PQqy5NkwXN40qXLLDeQiSglHS4ecvpmiFyzgI4MRpO2tWkGX5nHLPzdSUGPX5kMpIdYlkHcl+Js6UrHSOH1oXOHTY8x9nK+YpGjsTDA6WUS6O3lZ/EQH5X0RDaIVBI+jS10Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sht/v/sA; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sht/v/sA"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab1ba47so48367d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790098523; cv=none;
        d=google.com; s=arc-20260327;
        b=a4hmSzVrknABAVHqt2N/kqhQBJGzrXC9o+CN2zZ1jGTAY4QN49qqszR+NnA+iki8hh
         RzVW3Kocht9T2BJqQH5WQtus0CcSv/EMSCSdysyfd9BiimMJN56PztmgGMdL5ccVgPWO
         cXXkaGdntxNXwi5VJf0DH3BLgUTpl90E24ftL7tmMqlthhJYA+b1rnPzS76qmDg89nlY
         yrlY7+utz4bd5WAYoEMssgPKlK3ASGGEV+nELRUpzHySye7QqvMJTUCXProqfsEF7yJi
         iIhGi29F+vrGbRf/zdTqmT6RN3yZdR8XrJ6QsgPnQK3KCQp24oZjqlZumz6Wks7SmrR/
         s8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1YIIZbfM4YiwXaaCLt7e93dmE/7tvFPjqo3z+Kmpt0s=;
        fh=/af+41A/2uay9MDNrTwZkrUZMdUDN3X8o0npwAxHf+I=;
        b=T2YH88OLUkE87yjENAWetoL1WCSmMCoAQ0GyfK1e/1sdGBYepMqbTdoNqhcPBpQ9dz
         9eeLO//Z3IOxXRODIB6kx6mR1ENU7hNZWViI56PEnTaLOXCXkuCTQrZIjgSVb8ioR9nF
         eWUL7GW5wNrZMDCV4kEnN7IJcXUSO0J/kxzzJuq4q32pgWXX2jdmRxtDz7A+QzSCLsvd
         xz+UqsomdK2Ij9xhh4MpogCp8WaufFFBmUsU7P4AuorS5bZaE8xX/tXGhWh6hJuP+EeT
         m/zP73/kT2mKoJb5kYWgyx6CWQFX4R4sRfmT3QCWQXZJlDcDWBW5j2Uiekt+TJhQ7IqI
         xukQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790098523; x=1790703323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1YIIZbfM4YiwXaaCLt7e93dmE/7tvFPjqo3z+Kmpt0s=;
        b=Sht/v/sAfrRUN37eKKEoWQnMh7XIB1+dKe/SsTHaSyqNqjr2L4GdSFL9GF2IqlSkH+
         PDFcmzy11pPwpg6GvekBFullqKnaaRie4n9V86ZktrpY3umfpiS7n3JhynAgvOqrgKb+
         3o1jpVdF1OKJec/94PDhgPAsBPe+UUBc19lXADhhXWgTKIEyDpmXXg56MtCO6XIGxE7s
         Ve0pQ0A+7zkWr0d84YavRTNs9EObeQ7oHNNwgdlnh9U32OEWQ3E8f1R2jj8T8sX2Wdlp
         kE2IAadQy0HhPvrGtpYxt1K6Zb3LLeRk5XCihwnGnt/ZG7/Wbmg3oTcg+Vkzx4ljoljd
         F4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098523; x=1790703323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1YIIZbfM4YiwXaaCLt7e93dmE/7tvFPjqo3z+Kmpt0s=;
        b=jpQGqAwleGgyKoHxFA8yZXUVXsX1XsdjCKaMU/+rxzu2YhIwV0R0J0egeeR2a8D1Sk
         bLpU4Nndj7ckla1aFXDfe3+DATgV7JNRJRcH7tGBckqCdc3twWsyBYO/bCwX9qyWUduj
         KqDEZR21AvSa5yWtrsHE7aNqaJ05Z2W/myhuAYmYx+tfQMJFlxWX1ap9lKW81QjxqLCW
         fX3Om9hMRZ99F+mUE2ES3MqSWxTUc5zitfyiCTZRYFyv5xhuDXw64ybYRMoyT53m+3Sp
         IdXmKqBKR0WRG40/qmghcEcpfFk1/C4muzv7w2pUF1y3F7OMlgWbI9HHLVPUs8XfqGR1
         QCKA==
X-Forwarded-Encrypted: i=1; AKwUvBwhPRg7ZM92Y7FvMgNMJcJhekQymlx2pldOw4Yd70BiP41wshxnWZOwutHsZ12/mBXQVX45QrtLmLkXyF4=@vger.kernel.org
X-Gm-Message-State: AFuF++kb9lhcJfb6WjI6349lt7qVQ4JqC+RKRzn3atL9yOYAUn5WNYfA
	caGa9wKmIF52UAvsSaTpmmjUF9BeMTIh12vOXYR1SXEl/tO0wMu7uwadx3UozVGUwrlg9WJ/916
	mAPrtPU4nlqMSfdnnpdfCmn+G6dW+E+Q=
X-Gm-Gg: AYBFou29bntPD8MuKekKna6SuCNH5y9oM1nHjX0VdpjQ/Qtp4Zt8IdKeNG18LoUrzSI
	X+W4HAPR4oiu1a44feTfRBcVO8vMkx6RC/ejsixQVV3ZDan0pd6Mdms09pET9zEpCuQJOFNVV1W
	4VVnvUlnqxyqWHCKBzCVE0+yzleDMMl3fM6mo03onpMJvJAzPcCcClwCYJtNu92p8AyLRKJ1vc2
	/3ZcXJqSYv54MVQ4eF+c7QAxFFH1J2VoExwEKLAPqa+J7ARsCEYB2eZEB8iqWtPrEc/q/tkw2Be
	wZxgvT0bVaia1CuWFP3BXD468XFhXsCCjMnY4koNuU2euTk4Kh1dK82wzp4EYY6bmldNvM6adv8
	Mwdgxm9M35K4b
X-Received: by 2002:a05:690e:e8f:b0:671:28df:a073 with SMTP id
 956f58d0204a3-672d58a9a54mr129200d50.14.1790098523090; Tue, 22 Sep 2026
 10:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920212934.392398-2-eeodqql09@gmail.com> <arJjO3riWgdVKt0U@black.igk.intel.com>
In-Reply-To: <arJjO3riWgdVKt0U@black.igk.intel.com>
From: Seungjin Bae <eeodqql09@gmail.com>
Date: Tue, 22 Sep 2026 13:34:46 -0400
X-Gm-Features: AcwNN1UCk-bBKt_uB2kuYcZOnGQTcRpVj0NXGR-pjiW13Mcc-b9T2IadVnIwgCs
Message-ID: <CAAsoPpX1NgzMKJrvTdNp0heM0AMQAT0_t_2+AJdZs5fsZNpLOQ@mail.gmail.com>
Subject: Re: usb: typec: tcpm: type-mismatched PDO handling in tcpm_pd_build_request()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Li Jun <jun.li@nxp.com>, Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>, 
	RD Babiera <rdbabiera@google.com>, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 7:15, H=
eikki Krogerus
<heikki.krogerus@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> +Badhri, and also RD and Amit
>
> On Sun, Sep 20, 2026 at 05:29:35PM -0400, Seungjin Bae wrote:
> > Hi,
> >
> > I found that tcpm_pd_select_pdo() can match a source and sink PDO of
> > different types. Before sending a fix, I would like to ask whether
> > this type-mixed match is intended, and if not, whether you would
> > prefer a same-type check in tcpm_pd_select_pdo() or explicit type
> > handling in tcpm_pd_build_request().
>
> I think a patch would have been fine. You can always mark it as RFC if
> uncertain.

Thanks, I'll send it as an RFC patch.

Seungjin Bae

>
> Thanks,
>
> > The tcpm_pd_select_pdo() function matches a source PDO against a sink
> > PDO using their voltage ranges only, without checking that the two
> > PDOs are of the same type. A source PDO and a sink PDO of different
> > types (e.g. a Battery source PDO and a Fixed sink PDO) can therefore
> > be matched as long as their voltage ranges overlap.
> >
> > tcpm_pd_build_request() then combines the matched pair with
> > min_power()/min_current(), which apply the same accessor to both
> > operands. pdo_max_current() and pdo_max_power() decode the same bits
> > (9:0) of the PDO but scale them differently (x10 mA vs x250 mW), so
> > when the matched types differ, the sink operand is decoded with the
> > wrong accessor. This misreads the sink's capability and weakens the
> > min() bound intended to cap the request to the sink's limit.
> >
> > This type-mixed match became possible after commit 53fe0de9a35d
> > ("usb: typec: tcpm: pdo matching optimization") relaxed the match to
> > voltage range only; the min_power()/min_current() macros still assume
> > a matched pair shares the same type.
> >
> > I have not observed this on real hardware; I found it by static
> > analysis.
>
> --
> heikki
