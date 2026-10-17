Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5DF3B058A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256325; cv=pass; b=Amw8HvNkzOvfYz8+Io1RFGgAbVLIKYiXufMote5SjaXL41pcx22AtcDBOxKAK6Cd5kmSoqOu2NZl+akbp06m7u+HJZFBoj/LcFn5PemhMZDOMgxbhIUNluTUOYleledeyLs9RAwTp5Q0e4eGizgWs3Z6mccnbPCIELuvVQmc62s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256325; c=relaxed/simple;
	bh=oIhwnLqXpvnHxtG46G8WNHwz1LYqRAFP+Pfo+qHuE8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVM4u4ADx+Sp9zxGAg4AdzCQo7nHji1mvjWd+5A6Uef0ARWwRDZ+YSMe9HCCSQCIceutxj1Ene66mEBQDVAgf9sOxen9V/9/Nn3Rbp5bXjSKFgl70Nj23AQQgPLl2qOkSnJ3E5kxNnk6ETE3beNrD3Wh7Qrx3PzBXQIUSOy5xfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iK399bJp; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iK399bJp"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-313bab9cfe7so103907eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792256324; cv=none;
        d=google.com; s=arc-20260327;
        b=nPBNo0A5MQU3lIs14KL5TqlAzrZ2pjyYxdsJEC0qdEUggEMDhXrPYVZF/+iuePfyzM
         4J0FRX1vJb3lSnJJEzUnY0qg/6RvxszBKTa40LcBv5LiEBSfUdHyFhYH0QA/zA9WaxuH
         xyV3ENo/Kc57CmMCN1NpI8F0RyXy9bt0FLOVJ9DQxjPUs9mKLCAVVNFDDxFr5x+pu5Fu
         c1AdAV4MgyGfpcvkDiTRDL5gj3QJkLHq9rgM1vKbuzFJAMBjTn6e07Qoq9hHr56w7Hix
         2DvholpvA7eMgkabs4D3vMMBw8m78vFiP6zpXgoX4RWLLgCVsSkBzhx2rW10ZgAmHnrx
         Gslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIhwnLqXpvnHxtG46G8WNHwz1LYqRAFP+Pfo+qHuE8I=;
        fh=mxofvn82FO9O4UUDejYksVEOmARIFcDM86KDktbua+k=;
        b=nxrLL0/cp8u8RAbphf36XiZMtpfIizXrrMHy2uDfXMkwKJDqzfMuoUQUGzBLqPkZVK
         KHSglp4R1trgB5l0aLEf+b7EcMMVJ6nlvj/PNkDiISyQL2kq3HP81aFsZfA3EREUcLJ0
         7mvTxXM1S4VBavRHyJUGMNjCqnAPdtYSzLv4acHcFseAMJRe0kjjij6rb7P7xJjh3s4y
         2jQSqmeWg+u9SKwrTFP5AQrfbRTc3LfX4zlJm52Bc0xffV86uHY4L4beFaebIf1fKZm9
         6phmgoIrnDyy/xxquDzSR5LPs9lJSiv4L2F6IWME5eraHdCfiTeFuLGurESdj74kULeb
         Tpkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792256324; x=1792861124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIhwnLqXpvnHxtG46G8WNHwz1LYqRAFP+Pfo+qHuE8I=;
        b=iK399bJpHVP3h8CxU/foH+nN7ejtMxzRGiv3PgWhqxvpcBYhUJYUIe21+rrRpcUDZf
         Ysc60nzswVaGBa13BgpDHr9Bj/cmkAQhDCBCry9PxeJuPv+4QgoAz7dTSzO0XFMlkdLA
         IkdnKH54gIrsX2dRvWcG0gFTwBir1N6eajXMf4araWxG9cXzviuNO26z6FbOICs1xi8I
         8ay1Jn0czWcpU2QK4ZRSa4e1ncounsnoaD6Hr7dr7mN80/CiK3nCYpFscaRmdRQ1Ti9M
         2uj2b7E6PiLeHchmdaK5STdaeUtIO6CXnTJ/XUQIxjw8ZQ3NWmx9jfs/bbAJBG/rIZKd
         6Log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792256324; x=1792861124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIhwnLqXpvnHxtG46G8WNHwz1LYqRAFP+Pfo+qHuE8I=;
        b=asJqriaj6MtsH8lbysnMdJt60lYjdFFdxbZHU5Dk2zaCVTbR5gXVufYwSj4MPUH7ig
         xW+iQ/5MtaeGAvflNnhAOi03ljYZobt8Rj7mbZoxf/DmTqQ7uxTHA7dpbWFzgW8W6NcM
         QoEjzHrUw3jWIY/ig8AJBBkwAI10msX/8p2Afbq0IrDMo2lWwnFAJFvrGrkNFRuTnL3V
         nxQMzH0k6J138UzyvTsG8q3GfiAssFE/2zFuyHSfIfD0ZDvT0kRnpuo9YCgtSX78+56J
         TdxRRkjo+uIjIYNAg5t5bmZLMcPTi+IMXWDE4eFxBOpBIQZ9jD1kOocSF6tmaCtOvnzR
         uAQg==
X-Forwarded-Encrypted: i=1; AKwUvBwQufcm/m3fLKojgsFDYqwTvJAYAFffYcvep3Mn/pRHpScCeJmlJG7JM8A+AYm2exdo+UNN7pEWxsFIX5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx/KdwH2RCD8Fgu3UEZ88Ex3K2FrBZSZZMpDqkSxN6Q+L0xmHI
	wOCdR84XNLTCntdb9MpMfNOSfMQIzpMTLoijKoijy+RxYOOcZo5QfuPEza58rd2Tbp36sqamCcI
	H0HseXQZgeTB+8gVor91n0UDiqNxDIRc=
X-Gm-Gg: AYBFou1LrXqPhkvNSWaNq9DjB3UBSt2ud79qgHH/sb8TQhnEISinb+fJOHUk6ztGxZg
	yLfKK7yOtOMuiVAAs5Wgle4sthubdr42y76j4UX/txdC/g8Z9dyv1ctXRg3E8nMAa36Ov+yN0IK
	5Un6u5YxMCgIMMicvLZh2ZSBeKoIKj/UPqI9/EN6nPijkPB019jJwzpPfESj2a7gIh4n2MB4l2/
	ejQI7rVkJf2abdbm6zlqPY9k1HunEB3r0MEH4aCy5g3wVQ1Epp0JuSBcyvj8wOf+jYahJtEIP7Z
	P4Tptt5pgvDR7KxUPDFgMSN/2WriqNakJfQZx96W/n86Qz3eMP89V5gvf7+rM0aUG+iiht9wzFy
	h66CGL0pPfKetWWbG5LcouWLDmDRJIUrNOZNQumagWyUgpLTJRjGQx5+8ic2s7uWfYo0kr1qEoY
	PiJGjpS7Sd+GycI4ikScDxT7lYtmJQcI+7bNB+PD1Y0G4yW2wtgHw=
X-Received: by 2002:a05:7301:2706:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3619b601fbcmr6726101eec.0.1792256323689; Sat, 17 Oct 2026
 09:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014232030.GA3382959@ax162> <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>
 <20261016023418.GA3746059@ax162> <CANiq72=A-vC0RTav4v5wL+P2uYKzteJ2M+t0UOTXNniLCjh2pw@mail.gmail.com>
In-Reply-To: <CANiq72=A-vC0RTav4v5wL+P2uYKzteJ2M+t0UOTXNniLCjh2pw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Oct 2026 18:58:31 +0200
X-Gm-Features: AclHuK8xCih_HLKp1JdFCDIjoCYLnBEawHclaeGCvL0iU0jGmEtTCsh2gnAWMtk
Message-ID: <CANiq72mhaCSsMiXJstWMnvt77y7jJvZsQwnNCACs+YYioAoA4w@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:44=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Don't even mention it! I thought perhaps there was some reason like a
> fix needed -- if it is just that it wasn't updated, then that is good
> news after all! :)
>
> (I am happy to ping when there is a new release if that helps or
> similar -- actually, they follow release dates like a clock; I even
> have it in my calendar as a periodic event)

By the way, the Rust 1.99.1 + LLVM 23 archives you uploaded on Friday
work, thanks! :)

Cheers,
Miguel
