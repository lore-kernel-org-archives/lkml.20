Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F5256C87
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790445101; cv=none; b=PUkLl7HSs0mlZqmrw67UDnwf7A9cUrTMNJ9v0xqqf43EaApIre052r4Kbn7k83yn0a1+ZbImek3zVbYSMPsGhykuDx1VHgbuoIm/ePClumdnD3teKKbRBrSW8ke7nY1WjXSewLJQWVvNadqMOSKNb2TU9oskrAOL4tcLuv25ydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790445101; c=relaxed/simple;
	bh=EmUMS+ZRzCUeb0rndVpz/BHk6ngRvxk7aEnRstACYI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NgTPOk27q8YtUr9v9ss/ZIW25KCEqR9Btbv5V1lIrciYX1cMogzww/XS+cxmw3kb79lOfX6tl++mnC3a73gWEkWBS6PeaY4yFW6i1CsXrZ+oiF6Mq3lXWFxlcrCcK8N4sHzJ/cTd9njS59eY6NRnRBBJwKl6odvK9DRFgKIOzc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibjg0SkZ; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibjg0SkZ"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344213c95bdso3070eec.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790445097; x=1791049897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kh+HhJ5EU4L73Wf3xyAcV+eWsVVzfBMuFzfcoxTkNvA=;
        b=Ibjg0SkZLWdzPAHEzVIIlRd6aCMrNvPDNR+ALjtYaCw5nwVmXvx+awxsRA/Fo13rDn
         6Jd4sCBzGuQTfuTpazTUd7X43jGcGL2KqJWFlE4AxDsJ1OLKbinJOkWvteCoJTGwas//
         dlMnR8cq3fFpEOPCaBUSr59dKns6KROS8Ao8oP+Er/txKkSkiLANM5AfpzupXWKJXBDd
         ZFBChXnIeW2gbeb9OPFi5uTbaqbWH/0ix0MAizVGkQ0GdBXZp3q2tYMXBWc+553APZFM
         JXDlraeDWKLamSVUTYrJOpRBfUEgfE/wXvdNauczCMqcMsQufJ/NXc7UF7VKiABhlJNX
         Sd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790445097; x=1791049897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kh+HhJ5EU4L73Wf3xyAcV+eWsVVzfBMuFzfcoxTkNvA=;
        b=Z3WirqK0Fc58TgIiPA4I9bECYXySwbyjILKKkCSBVCfFxMYiuO4eHCYa13WxoJw+7H
         cUY7YyJYIWlwdTMFQ34YRQ/CqXP616rMpijhlLpD7IPQm/6QYtZOilhS7dWoA7YxmNXj
         Ggf/tCWT+Hacx0x81ozFTkzTD5iRUYSz9z0CKyWXMRGNwKteKQKuh2Yl1rT8cQkrHJXT
         RCfOaeL5XBazOW2HtlnaBXE1R3xhwqslMlmO7gJ8DRwdid5b8GcKj+bI9H6RHcfVAZRy
         onJ15DBsbIuD0ju2KVEXryaV/R5WfIOatRP2iPg+95Lt03bvlew/pB7Fd9oOBKrl/HT3
         XOcA==
X-Forwarded-Encrypted: i=1; AKwUvByHp3CQhF87K4ynvqunCxLx7eNMZs4ZkSdixKctsk4LWk0omKUWp1kyAqBguFbgHAeiLzzHUiHgpK3UcDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1ynfMFHTCmvCklVRU18XIlSBTHuV83MSRmqbQmUaEreupMRNt
	4dYFopGjgs3joOB+aNpNoJl0SnvNqmbL3QZhCvw+BGSH+gydBYRbvujfQoij6Nnf4zA75Q==
X-Gm-Gg: AYBFou1XWug7uH9WAHhIEJJ0AOTJJaIziYn36Npj0BOZ4KjMo0Vam0OJTbk+DIkNwjn
	Gl1pqTiJGJvXZRAmIN1ZjhCysCQYLlXPopa8Y8g7VjrrifvOvhTFEX4kc57tdQwN3DRpjBXYHTk
	h1EnXqgrz8d6dwAfTKMVmlsSUusdBiVAUPXoUlIOHOXSpX0G19MQ5tPk8aj2QxL2hw4h1ihf4Nn
	nDyZ+DGSGYAVRYUSteqXvZ5Lbts0qYCnjnCz6jhzv89Xp1xXoSe+lymyLB8g4i9AY9ry0EBVVC3
	WF0fA2EUI86Ydi6EQJ1SIM0jmbammtQ+3twvwW9dxcDZETkA5OHy7JYp6uBE+4kvGMi+3mdmvPF
	ayvNb4G0KN6aYikbvRYEONghmAsDZ02mRY0QogBMp860EZ68VeSVHtm6AUWx3Gr0A4iD5DlsAdT
	3cuQaOn7b7CMgAYjanS5viDzIxakqi4SPoykckFAVC6x+nYLdA84i1LJTfAlOwnPfT/LboNhR+P
	iWl2hXUbZuyXgFavO1GfIcNknH7f9d75Qg+sgtRfTz2NAMKh0hIlINGoqAl6GP8fxEbjQ==
X-Received: by 2002:a05:7301:540e:b0:33c:1bd2:1db6 with SMTP id 5a478bee46e88-3426d0df371mr5641086eec.0.1790445096797;
        Sat, 26 Sep 2026 10:51:36 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm15872673eec.24.2026.09.26.10.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:51:36 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Simon Horman <horms@verge.net.au>,
	Julian Anastasov <ja@ssi.bg>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] ipvs: Defer application parent freeing until after RCU readers
Date: Sun, 27 Sep 2026 01:51:29 +0800
Message-ID: <20260926175129.2612644-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unregister_ip_vs_app() removes each incarnation from its protocol list and
uses call_rcu() to defer freeing it, but frees the parent application
immediately. An RCU reader that already found an incarnation can still
access the parent through inc->app in ip_vs_app_inc_get().

During FTP helper module unload, the following interleaving is possible:

  CPU 0 (RCU reader)                 CPU 1 (module unload)
  tcp_app_conn_bind()
    find inc in protocol list
                                     unregister_ip_vs_app()
                                       ip_vs_app_inc_release(inc)
                                         list_del_rcu(&inc->p_list)
                                         call_rcu(&inc->rcu_head, ...)
                                       kfree(a)
    ip_vs_app_inc_get(inc)
      try_module_get(inc->app->module)

The helper module is already going away, so try_module_get() would fail,
but evaluating its argument first reads the freed parent. The subsequent
rcu_barrier() in pernet unregistration cannot protect this earlier free.
KASAN reported:

  BUG: KASAN: slab-use-after-free in ip_vs_app_inc_get+0x7c/0x90
  Call Trace:
   ip_vs_app_inc_get+0x7c/0x90
   tcp_app_conn_bind+0x1bc/0x290
   ip_vs_conn_new+0x1915/0x20d0
   ip_vs_schedule+0x697/0xea0
   tcp_conn_schedule+0x489/0x820
   ip_vs_in_hook+0x7bf/0x1f40
  Allocated by task 88:
   kmemdup_noprof+0x20/0x50
   register_ip_vs_app+0x12d/0x2c0
   __ip_vs_ftp_init+0x56/0x160 [ip_vs_ftp]
  Freed by task 104:
   kfree+0x131/0x3c0
   unregister_ip_vs_app+0x2f4/0x5b0
   unregister_pernet_operations+0x232/0x490
   unregister_pernet_subsys+0x1c/0x30
   __do_sys_delete_module+0x346/0x510

Use kfree_rcu() with the existing rcu_head to keep the parent alive until
these readers finish. Successful helper references already prevent normal
module unload, and incarnation RCU callbacks do not access the parent.

Fixes: 363c97d7435e ("ipvs: convert app locks")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/netfilter/ipvs/ip_vs_app.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/ipvs/ip_vs_app.c b/net/netfilter/ipvs/ip_vs_app.c
index 11cbdbaf561d..2c1b47702da2 100644
--- a/net/netfilter/ipvs/ip_vs_app.c
+++ b/net/netfilter/ipvs/ip_vs_app.c
@@ -242,7 +242,7 @@ void unregister_ip_vs_app(struct netns_ipvs *ipvs, struct ip_vs_app *app)
 		}
 
 		list_del(&a->a_list);
-		kfree(a);
+		kfree_rcu(a, rcu_head);
 
 		/* decrease the module use count */
 		ip_vs_use_count_dec();
-- 
2.43.0

