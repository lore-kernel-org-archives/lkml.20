Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702917;
	b=BEW2s4I386R0i9PzvRscGu45prZHSp65ulY+M3ZhAB7pr8ehJOUN2j5H4a9kFtmqUidv
	 by2LD/QPGeJgFjR1Fawufqxbhm0Z3cWwSiSPuywqGo0jwyUC1vd9xjYuUNoqAgMuP1wXP
	 NLqJkLFTgJGld3ive611d/xuCLwhW6vhRoEw3Hw2QHYNiz8nnmAY4n8UG1WMaImthpTO9
	 IzO8xckratu6ir35wqxWUZl4vSDB2hblWd/HNz55OqLvLhvXlLjnBRzjRx4FO1PiiPLjV
	 0sMDG573Ozfcg+TmdN1ntX03k6f0IfinL5IaCWQos62NV/C4fwdxLHDFLuEIJVOueHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702917;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vDrv9Rfc66q0u11nw2Ofk2AFrGnK5EZJAdaXF/Wufrk=;
	b=LOOl+DMs4QHadwUbSzrgU2bXrU6k07ucyO2pEgTJDjP8hy9ChM5YW+dh1IrFdjqZL1hn
	 ln8SbjPevgqAYMvENnIDRyaiHgAmq8gMz/2MRql+aS389/04p/ub+u7o40K1A/tH29bG5
	 OEnlaQR/Jw+03/29/AQHBhF4m+AiBTiGYXSb0355SeBDkc7LLSZ5kgIcraRxCnWuM0JrO
	 uNyq/I6uf/StXh4tYKu3Btbxnd138V6U85yuEBOEfcYKKTpl5eBwsfnIgvAdH49ZMS/jj
	 EipTlhx5d514b/SoiFPsb2Q+OVy1L+Rhm9JNdXKjq4Pk981R2VLZ5bkj1r96AoNdqrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8pcmt9U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8CF606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8pcmt9U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052281F000CD
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794702917;
	bh=vDrv9Rfc66q0u11nw2Ofk2AFrGnK5EZJAdaXF/Wufrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=g8pcmt9UtOsFI1fo9CxKbYPTzvsqw0sWH9ACzZvlMR51axd53xpfjIJHW3wwBJjhq
	 FFVA3mzmsjlRj+C1s6krHEnLtpMM9pDtWlKfCuGdddXd+8WUIwYX2wkDUE+o5um/Xh
	 R0P0QjTTbmMouATSYvV06/vhD9iuQMomja4hTmI1n4CDHkYoU9Kyqw4CR/7f+hjdav
	 TqpEA9lxeek3+otYFVTutJ8EzMNvgyVLTFd9Q4uWVBUmqS7k5s62pNOnHkImiXi2tN
	 zwTgVauW/K3/DOfeSeC1qpC2kUx9GFCG1zN9cx3+ZdFSBcQ7EcZCyYzd49AIzAJlgS
	 Ofb4GYI4WnJCQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5080ef9b31so421641066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:35:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF7IjUNkeDHWmFPIzMY8dVd+OqlDvpc+zeG/Cshgz1wprwPEdfnK6tyW/N6jm052wCipUApriP/1GV/KrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+33EJ2wa1/LaNXLsiL5B9exoHOvmLH5Zn9L+lKP0h3G/egcXKe
	z/f6N0IOxdQOIdPhPYdLHbHkaYL0zO0p5ZXRkkRexCEV6GDXLQp04YPugQdW0amXMR78S/gzZPr
	QDw1NeM7oH2MY2ONlAfO7MIwy/hNENkI=
X-Received: by 2002:a17:906:c114:b0:c46:8913:d89d with SMTP id
 a640c23a62f3a-c50962ecaeemr500449966b.14.1794702915613; Sat, 14 Nov 2026
 16:35:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-chipsatz-gutachten-geklingelt-81574928a5f4@brauner>
In-Reply-To: <20261114-chipsatz-gutachten-geklingelt-81574928a5f4@brauner>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 15 Nov 2026 09:35:03 +0900
X-Gmail-Original-Message-ID: <CAKYAXd91kBcAJTwkP11gN2igRkv8w_4sFgyxbtiCDhkVeLgs7Q@mail.gmail.com>
X-Gm-Features: AclHuK8d_OZBXGk4HXH5KANpQvxUhIOawFDebvYhDrOGOjv-Cq0-UfMC5ZNXA8g
Message-ID: <CAKYAXd91kBcAJTwkP11gN2igRkv8w_4sFgyxbtiCDhkVeLgs7Q@mail.gmail.com>
Subject: Re: ksmbd: SET_INFO modifies frozen filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, Jan Kara <jack@suse.cz>, linux-cifs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:38=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> I'm working on a freeze protection series and this is the part that
> affects ksmbd that I don't just want to fix myself.
Okay, I will fix them.
Thanks.
