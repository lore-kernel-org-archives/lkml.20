Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF9F30C16A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573167; cv=pass; b=oEfrf5cBCBEmB0W9kUoSSB9F4doGzTHHUFb4l6KK6hQ0XZ44tGSHGQmiEjrxY41hZUo95AleRF6/+fJ04lP0AN5uJsrCQ1AD7b3/1CIHsIxgePeNtMnFuQvPGh7OxuwPjS4pm7ctNV+pouhbNI88V9EXcolJG25Bn2iwHGScC2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573167; c=relaxed/simple;
	bh=wubeqTfIk5VUBpRsWPXRo7LgM8grLWk4CjJuaRVPQxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9eRxoJe8Mrn2+Rf374hXA8SxzCL1ty4wfsxhhJA5OkEnlDZ9SiHeQ94DqGcJbIkTicU2mJqk79S0I36+lWj4xoUgTFzkl28VoGv2b0AJ+m1RJmRlU4z8fjwFOpXaxxBs5WP3dvRlcJ9cFdZlbESFdbgdm8MtcLbQZdMDyRdeNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com; spf=pass smtp.mailfrom=clyso.com; dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b=XiaUz7xn; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clyso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b="XiaUz7xn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c252e703fa3so246610066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788573162; cv=none;
        d=google.com; s=arc-20260327;
        b=Xd+O5x7B+KB7Wwqu2LB58bDv4oz276z10Htx9+lxrq3obQTIJ2w9FbaWQWPclWvpy3
         xwuTtHu0ko42575W9LMfs0IBC32eHGjhvgEX1xkl3hFVQPMpJKwUHpJ06mdfNk74k5L1
         HlonGW6Az6ymKgL7hXfdn2KcD0U58cPqQIym/8a1VkclxXiR7RO5LTfC21Qv46OBMoXc
         m4RkBXJxi0QRgx7qoGMooLcbTh1mnZ+EmILc+91QY5YwGxczJnw/mb7MOW5oDkmFULQ0
         Uq9WQW9YCZDKc9+yfq2nEQ5CI9My4xkzunx3/uVDpO0Qnz3O1yp1gMPovBZqH93XXUQz
         ROtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yHC93WnHgZ8Dku4rdXUYkGVO/HeKiiDgrDdPTJNxOKw=;
        fh=RGAMe+NJiot/6krOq7/yNm3NG7j9MVtGhIwPOJOcGFk=;
        b=VZs6YqfXZ04v6OKZBlJoupLA5SnaYcxjrPci/iJSSE1HrJEm5+2k4R0jAAMERoFnhw
         aiAtwvNTYQ1KghYQ5cEY8LpNTPYBv1qDLpmnrN/qKNz4QNVVX2V6nrNFRNSlRY/v62Ne
         PiBRvIPiDZhGMuS8b7gyu/7Sc7nthOWnWkxLsqTQW4UySJiaq3SKcM8gOnxWQnLy+7TO
         ESueEnux1Z09BA06seN7wBrgx9Qrb3CSr18ubpiL5OClkHBa2Jq1N4R3mPuwQUs7XfIy
         7VcORjulDquTs/IGZewXjkHTrtPq2Db+TY1G5JHXQVhwq0WkVESeiI6ZvPU8gwmcR3cA
         +IqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clyso.com; s=google; t=1788573162; x=1789177962; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHC93WnHgZ8Dku4rdXUYkGVO/HeKiiDgrDdPTJNxOKw=;
        b=XiaUz7xnerBLKp3FnHsA0tR4fYK6OnVBLJSL4Qm0gmYVzKVMygv2XfDVqzZMJyIAis
         TrxnEiRbo7kq1b1syqomuKcRtY1/E7XHAE6ckd8aOYzsPnf3/SGGUZq39GJsX90T8GVk
         7s6SBE83Wl4mMiOCk7VdABVVYGt3Oq1ExPWdhQTcu2V8Q7qpyIX6AxsdjCFyo+7wq5eI
         UdllKB4SeQoy8No1U4qVmWPTiS92u4CtRQgBMK6WRq7yUB7uV1qR6FXGsjRidqE6AwZ7
         z5CTeQpmATThRgVhqID8GGRm32RpPpu9+vtVI5HWJwoXfL14bdRfBM7KcRGqmhYDDapw
         /D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788573162; x=1789177962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yHC93WnHgZ8Dku4rdXUYkGVO/HeKiiDgrDdPTJNxOKw=;
        b=p7zxaG/7wQlYRfQGNvqqRXIjR0IyTP8mKT2O0AE4EBZhiZOwlpOBgwxyl6aQSPSVuI
         KbsB76wy7RW5+S6P6t039G4Zqm5TgKbvbBelT62vY0W2WCX2dkuvsQV8d40hUWfUA6FF
         BoaWdz3PqMbRKjhIMa1WEx7A6p+mFhfLze1sFIP3TReZF+0xyn/03u//11NCAhk1nfR+
         VIpKRApch+KAWOO2eIjlBG9q4JxeY6ZqaR3H8+t/oFoHgNde3Cler6H2JKoJXErMuT25
         ZhZDTyINXuiUrYbgpjsU3O43aOQ4GoxGKU9vp0GkECSSj7CuoZ59S1/4UMEhjsYFKe1Q
         RMQQ==
X-Forwarded-Encrypted: i=1; AKwUvByBzchb19DUbhTQx9ooOoZmBNmd+TufvPYDm3oQh3H+xbV3FQ1A3/t5LS9SD4KLNg8d449/TwVStDgLB8g=@vger.kernel.org
X-Gm-Message-State: AFuF++m4arg9sylorBcbzckm/8M43F72Br3hpFA9/Nl/WHj5/5ORcN41
	Bqx7HeNNlfIRIzbEDeSo4Fqu7vA0HjU5d1uBJbEeA77WlcqneqxUkahDegPfM2vqaeRT7vTI+Ed
	nM9jIg8Yy8Z8R/YCQO0BxgVw/Im+OyfCQuw0el3cKbA==
X-Gm-Gg: AYBFou39PpDzP9QK32bpMfRoGM3vTj09+t7pc7dlZBMxEGO8hUAjnIbBj1VeBacOl6h
	C2di4LiHkqP5Ha8r0lB2Tt7l+Vl69h3WoQADmlf27PIIMBtqgYKKkLPt7sv5AB7JVyLXYi/DRqL
	W2ZE6zEgiZhZ8W7tOzBD+G0CCbdzoQ9X65e+/lh4SEU9VMHzhS7MxYNmWTTpT8p9sgoOP/z5c7E
	RGDdroXulomPUr/I7bjA+ypL/gruPZ98eBaNXcMxymVwKZbk3MX+Mp2V2eYPu7FM5qwgwI7SM2j
	QUlTGrqsaBiqKgl7rLCQOJXp0qdgHVd1P9VrTn6Ek9wbYMg=
X-Received: by 2002:a17:907:3c8f:b0:c25:4b9c:5ed1 with SMTP id
 a640c23a62f3a-c260c9ab80emr402694966b.12.1788573162537; Fri, 04 Sep 2026
 18:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com> <20260904150304.49104-3-max.kellermann@ionos.com>
In-Reply-To: <20260904150304.49104-3-max.kellermann@ionos.com>
From: Xiubo Li <xiubo.li@clyso.com>
Date: Fri, 4 Sep 2026 18:52:31 -0700
X-Gm-Features: AcwNN1VYV_bsyw2MRCUrfeCHlF3zc7lCehIidBhtYC3IhQAcHeY7tGhIM3OccVE
Message-ID: <CAOJNxRKM-vjeg-MKrNqarpn=HQb2gw1H3-FUxPR3a9E1=Ewy5w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ceph: stop checking a stale MDS map after dropping mutex
To: Max Kellermann <max.kellermann@ionos.com>
Cc: idryomov@gmail.com, amarkuze@redhat.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

LGTM.

Reviewed-by: Xiubo Li <xiubo.li@clyso.com>

On Fri, 4 Sept 2026 at 08:03, Max Kellermann <max.kellermann@ionos.com> wrote:
>
> check_new_map() drops `mdsc->mutex` in several slow paths.  Another
> map handler can install a newer map and destroy the map being checked
> before the original invocation re-locks the mutex.  Continuing to
> dereference newmap after that results in a use-after-free.
>
> Use the `mdsmap->m_epoch` field to identify stale maps.
>
> Fixes: 2f2dc053404f ("ceph: MDS client")
> Cc: stable@vger.kernel.org
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  fs/ceph/mds_client.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
> index d36a114747ae..86d592f06196 100644
> --- a/fs/ceph/mds_client.c
> +++ b/fs/ceph/mds_client.c
> @@ -5844,6 +5844,7 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                           struct ceph_mdsmap *newmap,
>                           struct ceph_mdsmap *oldmap)
>  {
> +       u32 map_epoch = newmap->m_epoch;
>         int i, j, err;
>         int oldstate, newstate;
>         struct ceph_mds_session *s;
> @@ -5887,6 +5888,8 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                         ceph_put_mds_session(s);
>
>                         mutex_lock(&mdsc->mutex);
> +                       if (mdsc->mdsmap->m_epoch != map_epoch)
> +                               return;
>                         kick_requests(mdsc, i);
>                         continue;
>                 }
> @@ -5898,6 +5901,11 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                         mutex_unlock(&mdsc->mutex);
>                         mutex_lock(&s->s_mutex);
>                         mutex_lock(&mdsc->mutex);
> +                       if (mdsc->mdsmap->m_epoch != map_epoch) {
> +                               mutex_unlock(&s->s_mutex);
> +                               ceph_put_mds_session(s);
> +                               return;
> +                       }
>                         ceph_con_close(&s->s_con);
>                         mutex_unlock(&s->s_mutex);
>                         s->s_state = CEPH_MDS_SESSION_RESTARTING;
> @@ -5921,6 +5929,10 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                                                "mds%d reconnect failed: %d\n",
>                                                i, rc);
>                         mutex_lock(&mdsc->mutex);
> +                       if (mdsc->mdsmap->m_epoch != map_epoch) {
> +                               ceph_put_mds_session(s);
> +                               return;
> +                       }
>                 }
>
>                 /*
> @@ -5936,6 +5948,11 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                         mutex_unlock(&mdsc->mutex);
>                         mutex_lock(&s->s_mutex);
>                         mutex_lock(&mdsc->mutex);
> +                       if (mdsc->mdsmap->m_epoch != map_epoch) {
> +                               mutex_unlock(&s->s_mutex);
> +                               ceph_put_mds_session(s);
> +                               return;
> +                       }
>                         ceph_kick_flushing_caps(mdsc, s);
>                         mutex_unlock(&s->s_mutex);
>                         wake_up_session_caps(s, RECONNECT);
> @@ -5991,6 +6008,8 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                                        i, err);
>                 ceph_put_mds_session(s);
>                 mutex_lock(&mdsc->mutex);
> +               if (mdsc->mdsmap->m_epoch != map_epoch)
> +                       return;
>         }
>
>         for (i = 0; i < newmap->possible_max_rank && i < mdsc->max_sessions; i++) {
> --
> 2.47.3
>
