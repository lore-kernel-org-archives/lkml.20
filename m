Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AAA35BDC2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900337; cv=pass; b=GjsTC13EZrvC8YfeBJPlU2WzD4fhH5X9CQ4nRg1eU7AA3UoxdrReMw4tRuafv5yoJ8WB6hZ5xZZiz2Tpk1r1LFanuYvNzRqsRDGclH2RvCPMVZgsM2Do+JnKC7xMUtF9a4tOM4kzGGihvQ5cPXnLSkaSxWTGaVg/HRtxJlZ1zTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900337; c=relaxed/simple;
	bh=ed/N2xFdUqvz8nCJZcFZgWxLj6i4+huAHshNYesy2DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoE+vUdgUAuS9ZhdsZRraLFQHCwFz/FRHnXJdAZmouELWvVnv/YYi3EdlzYmLMZtDGEaAoPqHI2Tm1xAH5GXxT0IB0xm8Zmr9PIbWevU+y27qyaggTF4yN0hC9RaVkrkRQKS47BnJQWC0XCKZ/HSB5Gha5/+96Dqew/WpRg4xZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWC/RRiK; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWC/RRiK"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso41242731fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900334; cv=none;
        d=google.com; s=arc-20260327;
        b=MKuDlX/R0BXl/UBHM7rRH9EpiaM9uqhwxtCAX7II55HQKVCVdyOsm24GC4dS+TGip2
         iAjxctdBDAru43YDzEX3BLo0Gxg7e3qP4OXChB1FSXIs8Vj5ObbLHfauVqAdJj8olxu4
         t0a5U7M/JR/lxW5LyojuSMXnWeq3GWN7PYYus22wCC0xw9EUJmkydNcvfaBOSg1NONPe
         6wVyx1K25ZUyVULgdMlFz6AaduA0eA2k5pHPqRpjz10SrDh3XQzzSwUWTPV42Ffgc4Zo
         R4OaALZ5AHgxjppoPNZDAUT5MOVnaWP3iQSSDBLtBosgIa5DMoxYwzXpRtP+tR+gWokU
         IMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ed/N2xFdUqvz8nCJZcFZgWxLj6i4+huAHshNYesy2DU=;
        fh=/np4XKqJs+KgIFFxp2tCqx5Cl6Cz8HjygTEa4Ao3gZU=;
        b=rbXgfOE8xGbyR/NQ4D4qBT9LoUiYSZTPa+RjkzJaBb4msI2ck5rIqRTzFfrK7Tz2wC
         2nOczW3b3/5npqULoJ3KDtopyFnHB707fkm8thunBIJcJGPzCHACmcw0dM30/X2eP/zr
         ITUV/K8K61CYFOqI6G4yF17DHWQpREaqnOganhP2DLu+yu1k2jjo08NszyBxODZbr2KA
         Vzgatp53rZ7WpcblhPc33qDto+NiNq/yRmippiqWrbSfEpttkKQMh0gbz8R8Ue8E3xX1
         7zOp9PvXLaivM+u5emJzh6ozadkS+rkiNfjQguGsCusMgBCfq9FslneIbL0OxQuIwsSE
         jFSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791900334; x=1792505134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ed/N2xFdUqvz8nCJZcFZgWxLj6i4+huAHshNYesy2DU=;
        b=gWC/RRiK3XSy/RBiHcqO5qCNdVluUp8YFoij0XGNbpAAr5UAcI0S9LD9KHbVk9jDwQ
         JibuL/gigS9yYYjEOTJP8xNKd8p1h+v0RnaHgCwfof7XllJM8ThaA4FqIg3DCuR4a9mc
         i4N52JQR4bIbd7IoEP9NG7GAbcEtpmCyIgfbvkaJXAp8WZ10cCxGFcVFY6d/J1wjdEY2
         LIDuTMIdP4mudKatP8V3RA9aM2WvLTktMxsyvS6noUuKv7Wj9P0LZ2owWvwCDv5CEujJ
         akrQcEPSr9aDT06OTiTwkNwEebj72HFyU4AekJuL57pbG6qvcLzozoAgmssy01rrW1qA
         Kmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900334; x=1792505134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ed/N2xFdUqvz8nCJZcFZgWxLj6i4+huAHshNYesy2DU=;
        b=1W9Aqdfnu+oglTqT+PRmcU7N79GEDmddpSsflNY9OhL39IZm7PVXXuZ4xu9Lqu4dzL
         EqNmkYxCGqrXNzq4CmxzLtdXX0Nm3xHzb6QJm4AdSpwvxqws84pxOp/CsPB/SeLS4qJy
         IB4Wib9QOAz1edctlriIJ6cMDmcTUXmOc11m80m+oh8HBdxsKHV4YkVAELLXIUP4W9mf
         lt+yz4QeKu1O+KPhNRPjmYmnSCQLuqa4dLC9JgPY2SuEelAXBUjT51H+iEezKRtivIZ9
         zEam7aIGeiztzpXvvoWIbCHzqeZOObTAtLPGkPo3NphjdStWHEtW3jwCRgSaHD9TnoJU
         NYEQ==
X-Forwarded-Encrypted: i=1; AKwUvBynFgFEoJcHlSu48KcFqYInW/gRXr4FnTmmRakXs1oAZm+bx+jwguaxAlHSEZ4Lmp7l26pgNpF+Bdlippw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuBgxxA57z6d7n6pYE73jqb7MYAnwqc0mky/lhu9LEx8ERC9dA
	GoW6yKLHesgBDR0Jeub2zdE9sJ0O+tvnGfF6zgiZETyqu7pRjofslWx+pWQVbTgKMIzrXqaxY5e
	BdPMR/w92bpBOleiAEnLxE8ToYprwjak=
X-Gm-Gg: AYBFou0EHoN5/c/KBOXH/l4Cydk5OCjfgdktvVv0oW5s5DgEbDn6CiAnZc/EJw1zHGo
	hYQXfyBoxFovk00PiiEboGe1ROAECl80zNLsZyFFS3mUPb51oPoqhfObvrd18vJHZkq5uG2q8Ls
	qL3m+enxMknmGao/Vv6QGQ6DHcPx5DSlcRTv2geg9WOYAFNb/tz5H/r0TuIOTkan3bkH8OSgCM3
	z2c8ruq6UtEhjfWLm8GI6I7Ue40VXGPXLJFhUQcPsG8uCb7jTylUHebUCD2VTOo/th32Mx8g/Ej
	UhWqjq0fs+t+lfEA+4CnCc0sXUoPcNUUfbKe1Jhz3lxs4pivlCnCD/TbfEudaNFXn6JoJBdz5lu
	cawuVxCPgz1E7mPhcmm7FptIKHFV7tUHeo0EVttHtoQIPSPguOvTJ+RI=
X-Received: by 2002:a05:651c:19a5:b0:3a7:64cc:1a25 with SMTP id
 38308e7fff4ca-3a9c4ebccaemr28657931fa.2.1791900334227; Tue, 13 Oct 2026
 07:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009125154.266435-1-festevam@gmail.com> <20261011083213.1486acaa.michal.pecio@gmail.com>
In-Reply-To: <20261011083213.1486acaa.michal.pecio@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Oct 2026 11:05:22 -0300
X-Gm-Features: AclHuK8nY-5t1j9xNJKObEZJmJAKXbcMCglGOgF53Mzkc0EVV19cWoVGf2_AYx8
Message-ID: <CAOMZO5ALdAyQvPf+40=EnTDndSijkQvZw8r3jbiiwHATyfZN6A@mail.gmail.com>
Subject: Re: [PATCH v3] usb: xhci-pci: Add TUSB73x0 definitions
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, bhelgaas@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, Babu Moger <babu.moger@oracle.com>, 
	Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:32=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:

> You mentioned working with TUSB7340 before. Was there any board
> firmware involved which made use of this chip before the OS?

I used a TUSB7320 on an i.MX95-based board, and used the TUSB7320 only
in Linux, not in the bootloader.
