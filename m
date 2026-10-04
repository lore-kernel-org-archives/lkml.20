Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BCB3B6BEE
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117100; cv=pass; b=bPW5SlcvK2jP4H69PG/1xnU66epzs3OL7tLuOMln6IX/pi8F4uc4Bep+rtu2/7DUuMU0U7Pc4iUBjLORhxiJHZZicxlnHEwsr0HDY1L12sCpg2WPgDjL+OxRZTR8y02OrrDF3sc5BhAO57VTNYuxKBqtY6stXo4AJUF9kXGUijY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117100; c=relaxed/simple;
	bh=GXfjk93rqVjkEm8QtrTGYzEWMYxFujv0Lq5SqSgVimE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOssdOm007Kc4viEnC2zcia7P+2GbToB0K7+o7uNHw4oQSmsiVkTBThe8HqkgGYCGaEvKfETpfBQ4PHNaUueNupnmpE3isAcp7FtaqUTmkgaMT0UV1havTI9cVZAdVb3grBUSS81UYWH9T6Wefzb9pWstuQs056YylUz1ZE2FwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oItSJmc5; arc=pass smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oItSJmc5"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso171714a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791117099; cv=none;
        d=google.com; s=arc-20260327;
        b=eJam/z4ql+spOdp3UdFAgmfSvuHl8yD9rDxltdx9DpZ608LJ3/N0czLICKxLDZpeSx
         tcCPZvbE5Ta4Jk6aXfj/Gyu8c+228xv3AeJ2tlKglgVHLI7xBqlaCWS9xTUZ+IBY8LdO
         4Xw01KlvKs/pupgCB1RZZMq64jKmj1UDIDMcJZ1hPgOgz6WMgzLl38cGxkYooxMAUJdf
         pcbLnKyrHd4VC2gfBJ/fvmyXt1bWb7WJgF+pZW05t7jt+Ss1vOhYjsbg0oGnTnpfGu8m
         2TcU4H+ZLkayS9HbiU6D12M4/DBfqzmvjg3zAkW7DRDJWwiESfmFU4rLrywGu4svobp/
         w/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXfjk93rqVjkEm8QtrTGYzEWMYxFujv0Lq5SqSgVimE=;
        fh=yiw2eecCTueXIn/y/M/geqk+BylcRNsH6rV8+crN/2w=;
        b=r72iw1rdJyetkel2ZStLamydxLkxf0zmZ8HF5ZGG5FEwo8LWic7Fc/WL/cTYFWMlFm
         wkpBGkkZ6Q8v9M4p+i3aX73AyiMhw4GKmeNVSeb1wi/WeAgq7zD7vaATpvIjc9uUFh5r
         qkiy+YMUrkM7Vbr8/pfBnrjY9TCTJ3g8q8X1SjiGBiE8qHDUW0b67tStiR+fuD4MDhYx
         TvGsRPj1Xv3008SSlhOKbcwHHELmKvQDeT9cKkJi6Etpnemt2U+gXqTwjR7qBBRFxVnd
         DIbkBehC9gZg6f38jT+UUFwpazqfeS9Un4fgGbbTWcyNH2ZbxdeU94U/AkrJL+pniSTh
         R3ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791117099; x=1791721899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXfjk93rqVjkEm8QtrTGYzEWMYxFujv0Lq5SqSgVimE=;
        b=oItSJmc5gplGn+GwGiz/D479gTHCHpP74bE0H2I+RO8okuiDd85BMkhj7l7edgbp19
         hIwPIhWIXeb08HAt6AqvoSq1VbFPcYa2os5RElxw4TBIleXKGKJ5PD7MQzEBZpUIOoov
         zO+OGA1EYRuLkGaNwgxDIKChUpYgwHgYLwszFPfmsfG5Z/S3HuyeKNI/ozl/o3ofUHSf
         vgAU/ps4ydoV+8w1FYlr6Fi6y3mNaQ+Z7a52yrH+vGtqGWRHOWPjNFyGTGfGOK0YJMsp
         ofD6bcZP96QzcziVT2nIsLY29w67wXHxPIYZO5JQIL6lqMeryxilSBdKuw++Y49uSgB/
         I8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791117099; x=1791721899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXfjk93rqVjkEm8QtrTGYzEWMYxFujv0Lq5SqSgVimE=;
        b=A/111xfrH47nQIVtX6bwv+xiCWjF4qbVvd7fIrPzvvTP3122QA8fU1L2coTHwbH5Cd
         2hWktS9yUMI+0qH5OtxSdnpyUWkOU5GzV/zjRmsnQwTsCIlb+jQv/4IUG7cp8BQnUULm
         oW5hCBXlvnoepwtTfVMCPgKpkBIe+3gehbLqb2ZK+xi7gpiN1WsfJ8452oh4CR4tVUKm
         58h8sfdX62Dpj8/O3SQjJNiPX2jH8kjA2bOj1bVZkX0Ia4Zh+eACW6FQ9iR1HfjQ9wLE
         e83dgVW/DBEoqwwndtJxBM+i8+E6Lx2fcHKCJzPsnX09nAi3QRK0n6lH6HiffxQsERQr
         IB4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeozL1uOswAxpXKvpTsxugvnPMAp7lqp6lgwgRNcsaqHCv+fKxN/6y1UbpEgEo9bxVMLWcZHFxe3SoDMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1N///D6ovnyZ9OVhZa74HpOIKYXX3LYSchtIVNty8xsPsDdJm
	MPaAh+AueABmzd46360LZKjXpRkTIG7FzwSkkJ/F/F+A8SzCDqUiZ5X4qKJeinxUyQ4SszHhFFR
	flXekzflmrAJmANJ3gdX3bz7M0X3MhOk=
X-Gm-Gg: AYBFou2zFBuwNfEaSI1yqU1n4eyE6hXGiDy3y43Za2D9BrITARIygpAznA0uoIojMg5
	Q0U6d+HJkaTl2/U+SM1Vz+Of/zebUIgTzscInJa+OjeSk9Jq5Hv8MDELQqCbWKnoRrCv4S83xiI
	yBpWxyPxtMlzPm744Y0iPIQtQx8ZNCk5lIJpenG/1Kbkjx/JHkXpwup5Axhb2weLZxFkLmSbbDq
	RwwUD/MtTceNzsoXkrMRArxi59agINAxeUHwRmzgY7nwrnjROds2XkQZ+MaGrioBO+PPdq+bgMc
	2E34bkLV/c5+mxNTiecVSn/bMUYKmaDfncm96+gC2CfXJsL7p+Mxr37A
X-Received: by 2002:a17:90b:268f:b0:3a4:e735:b3a3 with SMTP id
 98e67ed59e1d1-3a6cec8cd26mr4508237a91.40.1791117098607; Sun, 04 Oct 2026
 05:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001213915.1326602-1-adrianox@gmail.com> <20261003171352.10244-1-neganhat@gmail.com>
In-Reply-To: <20261003171352.10244-1-neganhat@gmail.com>
From: =?UTF-8?Q?Adriano_C=C3=B3rdova?= <adrianox@gmail.com>
Date: Sun, 4 Oct 2026 09:31:26 -0300
X-Gm-Features: AclHuK8R9Jo3-68_DE9TmeC3aACV1AZP1ZEQoMrqadGoXULvBmqZTbxMVHejPuU
Message-ID: <CAMGU2hUmzd1i0mpLG0M2sj1Ki+2Esz5vFQjqJ6F6RnJM3RafyA@mail.gmail.com>
Subject: Re: ecryptfs: validate auth tok payload size
To: Nguyen Duy Nhat Anh <neganhat@gmail.com>
Cc: code@tyhicks.com, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El s=C3=A1b, 3 oct 2026 a las 14:15, Nguyen Duy Nhat Anh
(<neganhat@gmail.com>) escribi=C3=B3:
>
> Hi Adriano,
>
> I noticed this patch touches the exact same lines as a bug fix I submitte=
d
> earlier for ecryptfs (the ecryptfs_get_key_payload_data fix):
> https://lore.kernel.org/all/20260917044558.41677-1-neganhat@gmail.com/T/
>
> Since your patch expands on this area, could you please add my
> Co-developed-by or Reported-by tag to this series?
>
> Thanks,
> Anh

Hi Anh,

Sure, I will send a v2
