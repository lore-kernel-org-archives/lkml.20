Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960953;
	b=YTEuEZmYqju744RII7oChgBdN2K/RURjHROZWYD2W7GfTpdjXIfHcaJaPhRMj8jsbh3Z
	 QyuD3q5Lp9+a89C5lx26O7CwKJddGvhh0DLoxH065WLHQ4gkcUxKRCy/1cqC0wjffTZrU
	 4ibvGnA9OnLVHPgPd/3WDm5EYKlNCXYwt52CmoguoGRFWxCTNI3Pgg41GqA4pDl6PpoXr
	 fYwp0d6xd5RjspJsCEx/viFDn+VsQW/1GRVLx2EHoYfoRvromK77FOrwTXBJTC0je2v5t
	 w2TfM9IjWkmtBV3D/sJnzRdsOfTxc6p+McqZzDACRgxfa3yyrW+/5ftbijP2x02X7og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960953;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1ZVwpDuEOvVP+5WMptjvGUaD4UnS5xmh0v3my59uo80=;
	b=CvWHduTEFHXwK2zWTQHD021/CUhI4EYhs5i+8v5PRVflrgciqU4nx8y5ZUhOP3+xbbeb
	 Eu4ZMdYoEK1wkguJIVPm0v3y8U6roF7de4oayHC83oNAtBJh4jM9aKw9F+T9UEVwkmdVc
	 d63XO8ZkRV0noFjj0PEy3c53cIeTnGyijYrU1Lh9ISrtO3LhN7ok4MuRNWYVNJC2CiuK/
	 tZxOZqQMMkU9XzzAvYslZML9RjsGte10CuxuUXIrZdIhAlcFf91xcDcN/qIBSRx6/+tQ0
	 o1V9N7OOzUDw6kfJpRTTeheqIYyLjFhzVBNWGdrVAjFTL3+G2OvWvCQsxAgFo9+IYdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cw6wxqO8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B0606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cw6wxqO8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56551F01825
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792960952;
	bh=1ZVwpDuEOvVP+5WMptjvGUaD4UnS5xmh0v3my59uo80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cw6wxqO869ZZJ8vwwoDzLpFL7knGGLPUHbSAAQ1kpxEmlLRSoAcIyI+7nCNkPXtXC
	 /sQV6Nvfef8NOsj/Vee6+JjdQSwsL8eGsx0BMC/21zb7xTzpc9lozSJ7N6zZWF79VG
	 mhefi2f4xhIQUZOWJNQJMiZp57XOxhMYe7hXPq/QPwTT/ClZNZV7lCq/+2OFBWsxrw
	 7Bbsquk/ryxVB+AxDl4L4wPHsfXS7lFVdaIMIGn6/3nH7z15C+TgtIieL9xFC7NZ5v
	 Nf14VG1zxAGC+aQJ4EokIMh5+0zoWQO5PXt/cCcE/eP1BVl+c1l6nRpKjLzjRsrTav
	 8ePHU+mvvPfrg==
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53cd0c8614eso925651cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:42:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQJrKm4n6ZOX0bFg3A1ug9UxMLXVhhqtcTa4CWcPtraH7iSOUm/+zCQxxKdrcOKJWNucORk8wfKqwVUFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjENHAndOA7R3RH0kPfrsnPhDoWafNRqCA8fqoALpIKYjGEB40
	ib9Nz4eF9q60b3aIwO1JimWerXtbnDDNLiXYxQMu3vWlg8FhmCSy+Bmxnnp9K6iME1v8tEeCqgy
	z7KMmjGKoodApvUqE8vxE8iBZBa+MUbs=
X-Received: by 2002:a05:620a:400a:b0:93e:48fc:aa88 with SMTP id
 af79cd13be357-940ef95513emr790870385a.44.1792960952180; Sun, 25 Oct 2026
 13:42:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025021839.1542805-1-senozhatsky@chromium.org> <20261025021839.1542805-4-senozhatsky@chromium.org>
In-Reply-To: <20261025021839.1542805-4-senozhatsky@chromium.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 26 Oct 2026 04:42:21 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wF2YfHwyDSt=B_+duiHCXke8JJgqGJcaw31JunUbxxQw@mail.gmail.com>
X-Gm-Features: AclHuK_u4ku4HYNTJ8RqUHQB0jHfvIpB2fBEVv08j0BZX4fWzV5XB72RUiMN54w
Message-ID: <CAGsJ_4wF2YfHwyDSt=B_+duiHCXke8JJgqGJcaw31JunUbxxQw@mail.gmail.com>
Subject: Re: [PATCH v7 03/15] zram: reset writeback state in zram_reset_device()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Brian Geffon <bgeffon@google.com>, 
	Bo Zhang <zhangbo0325@gmail.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 10:18=E2=80=AFAM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Reset all writeback state to its initial defaults on device reset.
> We used to keep writeback related data in zram->stats, which
> zram_reset_device() clears, but commit 1d69a3f8ae77 ("zram: idle
> writeback fixes and cleanup") moved it (along with the newly added
> wb_limit_enable) to struct zram, after which neither of them was
> reset anymore.  wb_batch_size and compressed_wb, which were added
> later, are not reset either.
>
> The patch is more about just being pedantic.
>
> Acked-by: Brian Geffon <bgeffon@google.com>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
