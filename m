Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917E3F105F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444696; cv=none; b=b7VmvorFArzD3LMa7A83XZQbnRtKqrVMIbxLz1cGWUVL3iZw5phCUba/58QO6vkBwuGIL+YVQHXsFFwM0okY5vLgi8IAv5lWgZKQLLmwfZt3ZrpORNk+tU9n4JijdyZsNH1at4wNzge5bXhL6QFJXAfe4DXvNbElhd/OO0YxPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444696; c=relaxed/simple;
	bh=wYOvGDLmTKvyznEI2YdSg6ayYejwZ+BvUUs6NbLPNrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4KTvFjPw+PZSxhnxfdJDYwDDjKl0rx++fxO8y1ZkG7mvO3jF0L1nd8sIEtx+8pgzG1fDd6MGZhsIpP4QBDrhfUgesBf6X2IeDmSyxREi8d79dcTv1Mcd3R8CGzbEPwmeIh7g+Y/Gk3Ka/CDYM2bhDzIvAR3QttyZce1P6kXEdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jO4vGZtE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jO4vGZtE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEA81F0089A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444685;
	bh=hgXM43tHGPmwH3n7UjXTQnwb08aCbZO7DGfxBqk6R9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jO4vGZtE6LmIMsuh5rHP00aBNWAr7BDT+Nto/XNr6/eUzRVr5H04RJFb2qmWiVg8C
	 alIn8GLCP0Y9O2gjrI9JS5d/k3DDiYMPqK84R4GGSUFwabjYzYAicaKoAvQ6Yv98b6
	 JCvJ1TZovMe5DX0012A7qt7+4RCE8qw+G1vS+FBFB29cJfEtV3AZlZgT18aXORNdLU
	 oQsgqimlFD6VW0YcLX1I8YHU9N0eRsWB8mwnuxyuAK1h8LKuY9ePLKuMx8mgWYabXL
	 synVk4HJsszrN7bpZ3qN9ltqAsxUR+Ouym8S6aSaELHu5TCJuvZ7h/m0PchetHGZWD
	 n/BBRVMwOoEQw==
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1875438f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:31:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxZMyqUjllqezUbH1b9ZdcnA2OymvhFkHWvSlyOI0iGYDjevc7qR52bzXpX8ZopIye/ueazBzqEOkcXPI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxmblLAhMBvVcHTrcxaXPeltye98Bl2X2tbMfeD5/fCQ0crzP6
	f8THXa3v7p+JPUcqYszYICikSkJ1zf9Ow6wfjczcfK42TcUpHgW1yeRO6jWi/PljxuelOLod0DP
	lx5gqe6h0ZD5z5OJjBg0eHnvA5izxIS4=
X-Received: by 2002:a05:6000:2304:b0:48c:7ab9:99cc with SMTP id
 ffacd0b85a97d-48c7ab99b74mr4162377f8f.52.1791444680209; Thu, 08 Oct 2026
 00:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-thead-maintainers-tree-v1-1-12d077a36f4b@kernel.org>
In-Reply-To: <20260930-b4-thead-maintainers-tree-v1-1-12d077a36f4b@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 8 Oct 2026 15:31:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS7+GSsVBonCq90_uUnMXN2Cd-JuABzWRrTcOakX66kOA@mail.gmail.com>
X-Gm-Features: AclHuK8dDt6mXE6lOlv9oIXUWPqegYUdStdtkMcJ90S7CqFS2v3WIY1wq048jL8
Message-ID: <CAJF2gTS7+GSsVBonCq90_uUnMXN2Cd-JuABzWRrTcOakX66kOA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:10=E2=80=AFAM Drew Fustini <fustini@kernel.org> wr=
ote:
>
> Update the T-Head SoC entry to reflect that the branches are hosted on
> kernel.org.
>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..7e8b59e1fc18 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23619,7 +23619,7 @@ M:      Fu Wei <wefu@redhat.com>
>  L:     linux-riscv@lists.infradead.org
>  S:     Maintained
>  Q:     https://patchwork.kernel.org/project/riscv-thead/list/
> -T:     git https://github.com/pdp7/linux.git
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux=
.git
>  F:     Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>  F:     Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>  F:     Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260929-b4-thead-maintainers-tree-46f2e6590dd8
>
> Best regards,
> --
> Drew Fustini (Tenstorrent) <fustini@kernel.org>
>

Acked-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
