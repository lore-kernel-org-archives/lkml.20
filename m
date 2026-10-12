Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F218C02E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781614; cv=none; b=PhgV6jDG3senYQlzYKLae1FxqFUr1PYMwka50yU6k77ijAz7CMapkIeMmbAvXiVKEwRSmKrkHc0VCXUA4EC3J7mXgFQQ/bC7yvlXs0c50MQmCguE7hKWq1FB0PmGAKY7oFRpoYJBhMaVy+DSGmg10UQi8b2EZ33Dw11TWxS8D6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781614; c=relaxed/simple;
	bh=UgrW/fs5Jhz7Jvkt5e6o7USVzzbUfd8gg4oB605oc20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qorsxeO5KRkScQmPQM55VrrjzYHnMOd2WvIQXw8yl5oldOzeDyDZpNOh75sqSsLfKMg8Ox49bukPNAlYyqmgH0F6dZ7HAw8SJuJBMkxl5+nXX9O5y1FcbF1BX7aCsSAtB7R25fkj6rMQfk/t4CehR9CYBZOMeXuAilH9MbSDEUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyPZu1IO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyPZu1IO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD651F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791781613;
	bh=NeZPrINNOL3KFCO/6o3UhZfq297cDZK8saDBec2fuiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EyPZu1IOXRT1Jp0WUWt5hqevoW76998db7F+ZNSuteI1fePOAKkWpcU8q6KuTm0NB
	 WNiIJsD9r3iwr8/d39VeYxnZlKUAi+V2gDEWh87+n0hrcBZafXPACUb8JmLCiFa0UO
	 haHxZcRl4l0C9uDkZ9ZSQa9+MyfV4pR7YcSIZU2mHg/UaTzV6ll1T1czs6t0R6hFjP
	 DnZJ6pn5Yx/sr1XlN6psMusdLURn2sRFDxJGABMi5jnanMqF02Jm45+3UVm4X4u1Za
	 tkMysvaDod9avyiMzstq6LQwJyGfbEAZHFpE2I1P0/1vENSq3jtdnl/6g10PYn9itT
	 EbfE0Po25MFcQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso229387066b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw/sRdVT2RGdvI0CNm6NeKOisCOkoJe4kRi2SH3BUkAK/I5FfJ3nhGtNG0yqrklPPSnKJCN8p6NSMSIKgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYISkIBNcZ+qIQyOVQ5fYNGjlKh34CnG9maGq5Ufyy4NA6TkTY8d
	SUemqyu4VFhmWlTXRSsXk7jarhQpeA+MiJ6r9ZUIdjQ0dsUFbn9zagiVU6TlGZDcab0WPVHuf4i
	qK9JdG+qhG36as9627bamyT1x4nWmE7Q=
X-Received: by 2002:a17:907:e98c:b0:c2e:8eb7:53dd with SMTP id
 a640c23a62f3a-c31aa0c19a7mr828171866b.42.1791781612284; Sun, 11 Oct 2026
 22:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923060246.2499192-1-liubaolin12138@163.com>
 <1385152d-9e3d-46da-9a3a-299ad60d521c@163.com> <asxlX7ysgW7--bE5@hyunchul-PC02>
In-Reply-To: <asxlX7ysgW7--bE5@hyunchul-PC02>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 12 Oct 2026 14:06:39 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9JuxCHRHnV5LQRgeQe91XHcG16UNTsDc4bwBo+RoYpHw@mail.gmail.com>
X-Gm-Features: AclHuK9uZ-e8zkm6iMKjUGONkg496_2Rhg_e4M_Eo5YbKfzOBZK-eLNbAqXuKQc
Message-ID: <CAKYAXd9JuxCHRHnV5LQRgeQe91XHcG16UNTsDc4bwBo+RoYpHw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] ntfs: persist Linux file attributes in an EA
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: liubaolin <liubaolin12138@163.com>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chenxiaosong@chenxiaosong.com, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> > Hi Namjae and Hyunchul,
> >     Are there any remaining concerns or changes needed for this patch
> > series?
> >     I'd be happy to address any feedback.
>
> No, I think he maybe have missed these series.
Sorry for missing this patches. I will appy them. If there are any
other patches I am missing, please let me know.
Thank you for the ntfs work!
