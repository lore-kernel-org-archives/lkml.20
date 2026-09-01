Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FFE486654
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282689; cv=none; b=PQdHK4ltgNdpwSnU/yN3uFRtecinnmb7Qg2Sh93tBSW1TCKUdmqX30T/SzofE7L5v4voH/mE1fRg3yi5jLK4GH0onr2zKOEt8nMTbTo8We4PJxNTwgW0hFJhj2gKwLcY9IUvUxe87KPKSdsCTq4jHwJ8RnO6qUmFvHQlC1c/GTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282689; c=relaxed/simple;
	bh=4osE2+pic+bc2hGNq/DZwaAdM11musKu70Ux3wS0E7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzTZeL/6Gay+QuqRNUAyC59hFJFC9hOIeRt87QbPkFa23cgW9Dtef6/yCIS+TT7ou2pPZvdwxKaXmVJLmBvmqN9vbgC97gJkLkvQyuk6MCCxa5gXttGMWvHadceRTCzLbKZ+r4i3vXLVVS3Zz+mZ2axhX5FFS5ooVSZfqIz8np8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGPQW+sg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGPQW+sg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB021F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282687;
	bh=4osE2+pic+bc2hGNq/DZwaAdM11musKu70Ux3wS0E7A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IGPQW+sglAnZj5qeEqHzmA70qy3Ni9KgQPEqXCKbUK4IB33+Q7IPkG8LzDg/uB3mZ
	 Kq3Po3fDvKcUPQI/yJ1hRnYcGV6gzxIuBUpCBuPH5dZICGFfxv1Ly+e3FRR/uMTnxh
	 yYVwSPNnvwKQjlmBhOmYK7yU7EksFb/PfADHzpj++sCNCH+4//PcELhWFn8dLdN/t9
	 0sGh0/U5bGTZHn1h3HqizxiIa9NtvwVyR8jBtExGIcJim+XJL/1eSIr+y649ZMvaWN
	 qj17xb7bFRqXhkEFD4Gt4Gw/xOnXISoylq4MDYm2Zxe/3qlAIcU4plNfz7SAu85US+
	 SNvk5TGlaxuvg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b568dae0e8so1005589e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:11:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+DMFAAKU5zuj7MTU0ZS5nKBOU/RXqXHB8bFRFgBykPX/z+pwKYXs9Md3a70OGtVkItEE6aR2mY7bq7kA=@vger.kernel.org
X-Gm-Message-State: AFuF++lylFK8AYnn16v0rdy/CsPAoycLuyqCAZeb/6V/gzd+CILDKP2G
	t3yapgPXwMZ9ZoRTYAREMvwM4/QHursxdn+qM/Ac8/cML/HMViEvLpjEUAAuPo5GYMn7VEn8t/z
	wRBxKGYdK1tsKcdo7WGV/mnJDZtaywRk=
X-Received: by 2002:a05:6512:3050:b0:5b2:aaa2:1d8d with SMTP id
 2adb3069b0e04-5b5e68b163emr12279792e87.2.1788282685778; Tue, 01 Sep 2026
 10:11:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
 <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com> <20260901085702.1515378-3-andy.chang@synaptics.corp-partner.google.com>
In-Reply-To: <20260901085702.1515378-3-andy.chang@synaptics.corp-partner.google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 19:11:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLmXOmdUSjRNwjCXN05=4712_6kkGTBQEGE=w=0sTe=8GQ@mail.gmail.com>
X-Gm-Features: AcwNN1VRAqdNZ-U2dFJ7BPD-layzZn8dq8uTQdjvd3-0sHds3HNLele41u3xr_Y
Message-ID: <CAD++jLmXOmdUSjRNwjCXN05=4712_6kkGTBQEGE=w=0sTe=8GQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Bluetooth: btbcm: Add Synaptics 4384 chip support
To: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:57=E2=80=AFAM Andy Chang
<andy.chang@synaptics.corp-partner.google.com> wrote:

> Add support for the Synaptics 4384 Bluetooth controller
> by adding the corresponding chip IDs.
>
> Tested on the VIM3 platform. Verified that the controller initializes
> successfully and that firmware loading and basic Bluetooth operation
> work as expected.
>
> The VIM3 is a Khadas single-board computer that I used as the host
> platform for testing the BCM4384 Bluetooth controller.
>
> Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
