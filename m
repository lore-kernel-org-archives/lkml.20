Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7CF372B2B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788240558; cv=pass; b=g/B/WfwXE1ReGL2BzLInsYVUhWLcJCsCIBMzG32nG5fL21vuN+WUN4U3+3xSjlfPSF5eMXVcDd1up0sp/aao2yoDV/i7rtXlIcHvTuStazJ/XMXPPLEki/NEGZYEt742mPKms8ztVnydhRs3Qc3ZH/mGZlTQw6M2iP9T2+t8vKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788240558; c=relaxed/simple;
	bh=GwctvFwVAkHjOBx4vb1TrJmuUy6f2b/bl2DeLQJ1Qkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CtKAu8nXvW2BGMwo3flbmzSVGMH1HpDE9ysi+qu9TIsKx0MTE0tn04LuoeZAhDR74hU79UpoPgm+L4qOPedZXd2BWkjTcXI40J2l1UW6bT0tAJMbLeIXZBTulNqhYYyxMePUCtrGsOAp2u8JwUSTCVebLOqVsJHDb8Nod5g0TDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLum7CxT; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLum7CxT"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4281499a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788240556; cv=none;
        d=google.com; s=arc-20260327;
        b=lJxE0tXHn9Hz6R8evzHPZzFr4H7c4Um9a9M65zqhFwV5QXHtC/nW/uiJiEjiFUH2Uo
         XRYbernqnBzo8IGznwX9DnZd31t0vn6tqiXJHo+4aAdeQIL9o+/q/TLfauln5IXDFsho
         29dxE75YjF6PW/L+cNr2xwxZdyYBlsmED+cUEXMFpavKY8bhBTeC60HAYaIFOXWCtK0+
         DFj2hqHWh6ZxCXWH0hu+O6t4vPi36FisHn7D1a6EX9wscmWT1xhqX8kx6C/UpL+vNiQv
         k2ELg8AuN1sTyEGeVUKkYiY41j+npa6kjJZ2YviR5xEDVkDhzvvEOZSLJtyBqPYje3HW
         7/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GwctvFwVAkHjOBx4vb1TrJmuUy6f2b/bl2DeLQJ1Qkg=;
        fh=BAq6lrP/MDJo/dCtc72VQwA1PMz8nGaQf/+Q2f0cyyA=;
        b=O3igwSNDYxgKi4vEqzs9BtgdCfK4RIOomwuihF+Yj5zqKfO9VApzufVl1a5Jobcv9N
         rCxsnh2o7XuGBtlFpI8fhx+WE1TUbJ0WLjVti4SuXvt1vh33oBSdqrB6CpkgtHfd6zJC
         QC1GWrqFzdBR/r96wcK1sgkGLafR4Nb+bqOcAUDUOrPCixIjr9KakmSieC064tn6mPao
         I1QHtal4MGgdEbwHBQJZKC4w7NQkSlBKnQU2lnjTJrs7VS5KGKMIijsWdXMWkvz0miDu
         7QSNIvzKnaRE/AbMJUanJy4jrqVxceTMA+YmKOsfWAoQoF+jSJl2apHdu04g5KgNL3B2
         zt+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788240556; x=1788845356; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwctvFwVAkHjOBx4vb1TrJmuUy6f2b/bl2DeLQJ1Qkg=;
        b=YLum7CxTRINirvmrxLuNbnKa8zV1npR9BdkWNXS8DGFuJfD188YQ6MagcUydcr2Bql
         CtKdEr595+Zyj5uZUC+Wy1s12/X0k3ri6b5J5FoumC4OxtkyME5H0v1orex6bmrx47vV
         JhUQye88UnH6yHtIgKWt+xWpZfet+EBP25fCcUj6uHqNEemLARKUJqc5LcQhfoEYvSQY
         4ozWsC0SjtcqpXffQ3lk6srV5XD7SdiKfrvdQNfrZlK9If+9kZA6wQSXIBq0Me8blu6D
         2RBNRuDbGnC8xMjYuB9tyVMgzvOeyfQWXiTB6jw7f6vuiBdhdWyrEUUNk4Fm5RYG0RA4
         yOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788240556; x=1788845356;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GwctvFwVAkHjOBx4vb1TrJmuUy6f2b/bl2DeLQJ1Qkg=;
        b=ENWy+mVvSFq8x5ow1pjb+z2gHwcY1xJ+z6UTX6JljtEM7/rUsLq+ND2Lzs65q0AaZU
         Swmi1TAkGgCaYI131PSAtkPiBknfPjVux8ge+ZJu50ulCw7Po1uGg/2g0WuGC7PbPjdz
         mUqrlN+64PKskIq9Sjurui+YoSOAq2nAu8Hmu10lZiorYH0kHu+gqUDrBLDLglo+nxOm
         I/ssJt6ygv1Z5O18VI/fY+WTzY8dKlFo8olAR7tExA0wDMf05SS39ivPk2KcBB251iBR
         T1I+VOgrqcWiz5Z0TD2k0JA03Kjd1fuXE6T5h0X0xzM7DsO4TnDVbS0OzTWpLlwPstPF
         Cb+w==
X-Forwarded-Encrypted: i=1; AKwUvBycfr/QK+mWu5BA9pZeQzxX7IkGNa3a0mTKrW6y6kXvVE1Q0U5hkFYnHt6lEkvsD18gzmV3KmiOCaJ8SJk=@vger.kernel.org
X-Gm-Message-State: AFuF++nSH+HAOj80vjqUTIo56Dd2UlKBde7yYNXDf+P+LuSasMprcxnB
	x08jJDrfmgfAF1NLtDpLsUMjEzGy9/h9XsMEy7Zm2ms6aGygRGpzmr7tUjyzYCjGEDfm6mM52hH
	1zzFQD1/M89eC3Amlt2KpQEplQ8P40FI=
X-Gm-Gg: AYBFou3KjKsjodmNBDXW1ZXzt2oEJHTdmZAUk1S9SjfqMbunfpcSnSPTmBQtLWUL6ht
	Y/UHyVddReFfaIiwEH835AndcFLOgR+JC9eZQdQTpz+LPBB0pwEQ+gIT/qKmnNn5mi5Xn4MWqN2
	khvqz+Y98puWP/5mUY311ooL80qQ5bXGfar0vmf/eo7tx6VyF7XxAQguYxelqujXExhVdYo8xjE
	xEIBil+MWZvJigojdI2JAZvUIKe0GknSPGtk0VnnKzkF44MzeRffov5Vy0NTnmSdblb2uU8tf4h
	rYCRgGZraTXFZ2KKaQjEcHf456Tev43dzi99KSdCGIEjKcBWx7xZi6jae/RCExXRMFjZQHkoA4g
	xqUVYkFVo5XGSgu68nNOP1NI4YEY=
X-Received: by 2002:a17:90b:3910:b0:398:9beb:5c17 with SMTP id
 98e67ed59e1d1-3989beb6373mr29600132a91.18.1788240556415; Mon, 31 Aug 2026
 22:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831085217.391-1-strst.gs@gmail.com> <CAOiHx=md28_BmsDOsNDp0XbUpfih=P+-+aDYb6tiWPJTCu1drg@mail.gmail.com>
 <CAAsRjRktqEx+-CLDO_q6rLUBe1dtRQPH1NkX4xy7ichx79yGPQ@mail.gmail.com> <739079cd-dc83-4b53-a3a9-a7e610379d19@broadcom.com>
In-Reply-To: <739079cd-dc83-4b53-a3a9-a7e610379d19@broadcom.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Tue, 1 Sep 2026 08:29:05 +0300
X-Gm-Features: AcwNN1UEeHd9ZRjJ0HoaeursBIRKyHkxNHGprx228jpqMq4BYYExnIVM06ec9EU
Message-ID: <CAAsRjRn8AFBN7k3i4TMLpLsyFQc5DSL-a9u+OieFyVtYgD6x4w@mail.gmail.com>
Subject: Re: [PATCH net v3 0/2] net: dsa: b53: fix 8021q uppers on standalone ports
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	vladimir.oltean@nxp.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Florian,

On Tue, Sep 1, 2026 at 3:24 AM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> But you control exact how the DTS gets distributed in OpenWrt, why not
> just fix all of the DTSes there and have the users confirm that using
> port 8 as the IMP works?
>
> Don't get me wrong, I am very appreciative that you spent a decent
> amount of time trying to come up with some sort of solution.

Thank you. Yes, that is what I am planning to do. Port 8 as the IMP
is already confirmed on my board, tagged RX and PPPoE come back with
no driver changes. Next week I will start with my own board in
OpenWrt and hope owners of the other bcm53xx devices can confirm
theirs.

Best regards,
Semih
