Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEC9202F70
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082399; cv=pass; b=dR0w39b7j5xNFk3ofVi+ZgvkDYhL5+jtGvVSU4OO7rtIhYAx4EVk82EEzE1DYTp1JqDVPqRjDxP0B4xVz8AzFIa1mEKBIPAOwFXsbJLWZMssPR0Gr3extKK0BPnjnfkCEEZkCWXDWB+UNgpPtjYVxlQJ/oL2GiZLXNOHGYSFL1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082399; c=relaxed/simple;
	bh=XjkYzubNknDxtSLcJD0OSIc3FWWZftOwgASfjFMJ1JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3m9QOl3OMQ+qwr6uS9KVaC5H6BLtORntXgGffou7sZYQv3vFom8d9dCB7C14M6dfR/vcK0i+mMqa5MNi//bxqShwnbF0egIBpWdRRlsLfAsJk9Np541M0CiUMmtZO+fjwk6qHLUUZTsu4VFCJTJwzqeXp2KM07LkYTioHcj+Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c255206b4dfso315432566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788082396; cv=none;
        d=google.com; s=arc-20260327;
        b=fPbW0hoh6x28nwmnonTfna++DTCfNtaRHPvPQJTHhczErF7RRG9mnifTZpMQQf99rE
         ksSg9mpc3i4bqiPCqhBjHA+HnLm+ECx6cF8b/QkLw/rErOWcT0FWf/WCCKsSkJmj4NTI
         lFUAFCuqp0s22im/xYsFe8Y540is25KcsmOW6ukeuc5i0EXpxDm5PUd1elWVByy5UdZl
         +nSq8dle60ZA4BljqgAq1Yd3NHPXO4A1HTghKrZwLjj58qYfIo8ZBjhRE+8tTCT917GM
         lJcq/J1JHM9YM5JXWJeGYV/RHfF5AUSTjdExTcYoaNcGikFwFQOOFPyHYrGB2/Jyhhab
         9Cpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=4S/Q8LsIlAtco+cE6yiBQGlAUU2xKF533bVW2yFHbcQ=;
        fh=VnyyP2HRsmdy9k6D21R3rOZyEEFjy2WAe6q+I6qCwzY=;
        b=IThXvyZBUq/JJUpY7QPltfFmK6ZBkfA5iW3j8Zh4MfcdbxGFw5s0/C2Mvj3HB98vlO
         SUb6giM+0Y0ARCXBw7r+outOA04pgOqoy+j6BmaOZ5a7/411ya54A2PzJCex6wXutqhd
         J+7TU5ZuT1XX65JqQrWnPRBhTaBS94o4jgJzMzRyPPtSXRyeBu0jQl/zbEQ+WGIx66y0
         i3zBQiWxQtfCpMfCOPi9Fi0pIzG99l+J3fOGYdzlf8O/EGpsQeJgEUGmFLp6RDaT9TV6
         gLTynEALPU3pmuhrI3dcPHIvb7CwsGtUaRo67VUgaRuoYrm2xq3iJsYX3hfzFkuawbCo
         FQkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788082396; x=1788687196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4S/Q8LsIlAtco+cE6yiBQGlAUU2xKF533bVW2yFHbcQ=;
        b=R8Y81RWnFB/Iusdw7CKOajKCtv80SlukK1pdFJsRo89srQvcr6ASZYlqgXvmsrTTfJ
         2jRhwn9el5q7Txmldao38n4EDvXsxnrpNOqI23cqhb9646/m34x8C7EAOCJW69Krz5yl
         ReZU/TJIYprgRj3KZPLPkuKPkFHfJBuvOwGylDiNOICorHCfc/R+/tNYpY/4ioLATWGd
         tjQEt+6S+tL1b2DEHpE8X3Kh9pSHA97o7YTauNFch3UDLXIWYK0HDKhooYwx14dzg+uL
         ZoldpY0xmeuDm/rf1cf6h2WGxF1aGEJpQFQBIgHJYuFlISuxFuyLUwBoR3psB93sHYyB
         Klzw==
X-Forwarded-Encrypted: i=1; AHgh+Rpke0qBaXbDz+fosyMEc0e3naLAI+ncV7iuDhpz3ul/cBXdVgAHmvIoQNd/ObhU9XZ12rG3k7x8eIz+r14=@vger.kernel.org
X-Gm-Message-State: AFuF++lYRJoiwTBSbTO823AfBWsLdpxUtUiRKFEHuMC8d+fNBnhVOtsU
	jk8S8OV8oHR8uEb+v3wfz/eDuyAdgr8/LqCtlwlsBpeTPTpmJ5zJUcNMFPghLcUo2FyLkpNTKwF
	CGUD1AiJvQC8o4slbh8uQjLDsRiuT4s1I1chXqmkB
X-Gm-Gg: AR+sD1146d6xH6yHPXOvcjbO1uYwCr+x3ri51FjMKa0gjsz382+HOmHBo5Vzq7aMARq
	PsWMhsz7bZ7BZjq5ykOwtRhJyth0GZBXyTq542Qnef3s1Jxi3J51uXC7mrjDRd+2CTbyqQMzd+L
	900u1czsLVtVP6T7LNay8oQlJPr4/Vn8YQFbnqsUCS3IZYsjCuJlk6L+32zFd7est5S1eIM3197
	WXf/Lsu/JGJZ1D73AH2BbnIj2AbTcD1I4gRrS3RoMeGUq4G93D5HnCTyghhf9zs1QYQlR8UGVQr
	IaM/rfgAEGWMsZE6ayrJ2Qv/qqahVDIeWtzNPVnRvpoaiKqMzyAg/YIZORc2Ry8xNHJVB0uPNut
	iVYV2fQLBGaBOeY7HZMj1BDuzbanhxaRisb8=
X-Received: by 2002:a17:907:7a13:b0:c25:2e93:289e with SMTP id
 a640c23a62f3a-c25571deb5fmr1292724366b.16.1788082396393; Sun, 30 Aug 2026
 02:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com> <20260829-xhci-no-soft-retry-v2-2-0efe22f1c2f8@divinehawk.com>
In-Reply-To: <20260829-xhci-no-soft-retry-v2-2-0efe22f1c2f8@divinehawk.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Sun, 30 Aug 2026 11:33:05 +0200
X-Gm-Features: AcwNN1XMIbCJzCRFD4Hg1pCFjnrmfyXU44jNCBVbq9X8JPUOmt7-zWV52VzJ6iE
Message-ID: <CABUBpLfK=w6e-M_TV4BfwX7EsUCLaZO7_GN9_506yHvBFEWJEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: dwc3: add xhci_no_soft_retry software property
To: linux@divinehawk.com
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:04=E2=80=AFPM Matt Eaton via B4 Relay
<devnull+linux.divinehawk.com@kernel.org> wrote:
>
> From: Matt Eaton <linux@divinehawk.com>
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index c5674161b2b0..e22a8dc5d090 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>
>  int dwc3_host_init(struct dwc3 *dwc)
>  {
> -       struct property_entry   props[6];
> +       struct property_entry   props[7];
I think this should be props[8] now as it should have been props[7]
before (latent bug?), with the last entry being NULL to satisfy
property_entries_dup(). I can do a patch v3.

Regards,
Matt
